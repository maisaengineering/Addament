class EducationsController < ApplicationController
  before_filter :check_user_profile
  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @educations }
    end
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
    @education = Education.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @education }
    end
  end

  def add_more_school
    @school = School.all
    @education = Education.new
    render :layout => false
  end

  def create_education
    @education = Education.new(params[:education])

    respond_to do |format|
      if @education.save
        format.js
        #format.html{redirect_to  edit_profile_path(current_user.profile.id), notice: 'Professional Industry was successfully.'}
      else
        #format.html{render action: "new"}
        format.js
      end
    end

  end

  # GET /educations/new
  # GET /educations/new.json
  def new
    @education = Education.new
    @school = School.all
    @param_id = params[:id]
    if !params[:id]
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @educations }
      end
    else
      render :layout => false
    end
  end

  # GET /educations/1/edit
  def edit
    @education = Education.find(params[:id])
  end

  # POST /educations
  # POST /educations.json
  def create
    @education = Education.new(params[:education])

    respond_to do |format|
      if @education.save
        format.html { redirect_to my_account_path, notice: 'Education was successfully created.' }
        format.json { render json: @education, status: :created, location: @education }
      else
        format.html { render action: "new" }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /educations/1
  # PUT /educations/1.json
  def update
    @education = Education.find(params[:id])

    respond_to do |format|
      if @education.update_attributes(params[:education])
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education = Education.find(params[:id])
    @education.destroy

    respond_to do |format|
      format.html { redirect_to educations_url }
      format.json { head :no_content }
    end
  end
end
