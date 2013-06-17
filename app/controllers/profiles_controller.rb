class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  before_filter :check_user_profile, only: [:about]
  before_filter :authenticate_user!
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
    @profile = Profile.find(params[:id])
     @users = User.where("id != ? ", @profile.user_id)

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
    @company = Company.all
    @professional = @profile.professionals.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @company = Company.all
   @profile = Profile.find(params[:id])
   
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])
    if params[:user_role]
      up_user= User.find(current_user.id)
      up_user.update_attributes(:user_role => params[:user_role])
    end
    respond_to do |format|
      if @profile.save
        format.html {redirect_to my_account_path }
        #format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        #format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  def code_image
    profile = Profile.find(current_user.profile.id)
    @image = profile.avatar_file
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

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
          format.html {redirect_to new_education_path }
        #format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

   def about
     @goal = Goal.all
     @profile = current_user.profile
     @past = Professional.where("profile_id = ?", current_user.profile.id)
    end
  def about_update

   @profile = current_user.profile
   @profile.update_column(:about, params[:profile][:about])
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

end
