class MyActivitiesController < ApplicationController
  # GET /my_activities
  # GET /my_activities.json
  before_filter :authenticate_user!
  def index
    @my_activities = MyActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @my_activities }
    end
  end

  # GET /my_activities/1
  # GET /my_activities/1.json
  def show
    @my_activity = MyActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @my_activity }
    end
  end

  # GET /my_activities/new
  # GET /my_activities/new.json
  def new
    @my_activity = MyActivity.new
     @all_activites = MyActivity.where("user_id =?", current_user.id).order('created_at DESC').limit(10)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @my_activity }
    end
  end

  # GET /my_activities/1/edit
  def edit
    @my_activity = MyActivity.find(params[:id])
  end

  # POST /my_activities
  # POST /my_activities.json
  def create
    @my_activity = MyActivity.new(params[:my_activity])

    respond_to do |format|
      if @my_activity.save
        @all_activites = MyActivity.where("user_id =?", current_user.id).order('created_at DESC').limit(10)
        #format.html { redirect_to @my_activity, notice: 'My activity was successfully created.' }
        #format.json { render json: @my_activity, status: :created, location: @my_activity }
        format.html {redirect_to new_my_activity_path}
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @my_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /my_activities/1
  # PUT /my_activities/1.json
  def update
    @my_activity = MyActivity.find(params[:id])

    respond_to do |format|
      if @my_activity.update_attributes(params[:my_activity])
        #format.html { redirect_to @my_activity, notice: 'My activity was successfully updated.' }
        #format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @my_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_activities/1
  # DELETE /my_activities/1.json
  def destroy
    @my_activity = MyActivity.find(params[:id])
    @my_activity.destroy

    respond_to do |format|
      format.html { redirect_to my_activities_url }
      format.json { head :no_content }
    end
  end
end
