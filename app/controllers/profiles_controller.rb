class ProfilesController < ApplicationController
  include Devise
  # GET /profiles
  # GET /profiles.json
  before_filter :check_user_profile, only: [:about]
  before_filter :authenticate_user!
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => [:about_update, :update]
  #before_filter :find_or_build_profile,except: [:create]
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show

    @goal_comment = GoalComment.new
    @profile = Profile.find(params[:id])
    @users = User.where("id != ? ", @profile.user_id)
    @goal = Goal.where(user_id: @profile.user_id).order('created_at desc')
    impressionist(@profile)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new
    if session[:social_login_data]
      data = session[:social_login_data]
      @profile.assign_attributes(first_name: data.try(:first_name),last_name: data.try(:last_name),
                                 location: data.try(:location),
                                 phone_number: data.try(:phone))

    end
    @professional = @profile.professionals.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
   @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    up_user= User.find(current_user.id)
    up_user.update_attributes(:user_role => params[:user_role])

    if params[:current_email]
      up_user.update_attributes(:email => params[:current_email])
    end

    respond_to do |format|
      if @profile.save
        format.html {redirect_to new_education_path }
        #format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        #format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  def code_image
    @image = current_user.profile.avatar_file
    send_data(@image,:disposition => 'inline')
  end

  def other_user_image
    profile = Profile.find(params[:id])
    @image = profile.avatar_file
    send_data(@image)
  end
  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
     current_user.update_attributes(:user_role => params[:user_role])
    if params[:current_email]
      current_user.update_attributes(:email => params[:current_email])
    end
     respond_to do |format|
      if @profile.update_attributes(params[:profile])
          format.html {redirect_to new_education_path }
          format.json { respond_with_bip(@profile) }
        #format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@profile) }
      end
    end
  end

   def about
     @goal = current_user.goals.order('created_at desc')
     @profile = current_user.profile
     @goal_comment = GoalComment.new
     @organizations = current_user.organization
    end
  def about_update
   @profile = current_user.profile
   @profile.update_column(:about, params[:profile][:about])
   respond_to do |format|
     if @profile.save
       format.html { redirect_to about_profile_path, notice: 'Milestone was successfully created.' }
       format.json { respond_with_bip(@profile) }
     else
       format.html { render action: "new" }
       format.json { respond_with_bip(@profile) }
     end
   end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  def preview
    profile_con = []
    profile_content = Profile.where(first_name: params[:search_txt])
    profile_content.each do |each_pro|
    profile_con << each_pro.first_name
    end
    @profile  =  profile_con
    render :partial => 'preview', :content_type => 'text/html'
  end
end
