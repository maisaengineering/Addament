class ProfileCommentsController < ApplicationController
  # GET /profile_comments
  # GET /profile_comments.json
  def index
    @profile_comments = ProfileComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profile_comments }
    end
  end

  # GET /profile_comments/1
  # GET /profile_comments/1.json
  def show
    @profile_comment = ProfileComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile_comment }
    end
  end

  # GET /profile_comments/new
  # GET /profile_comments/new.json
  def new
    @profile_comment = ProfileComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile_comment }
    end
  end

  # GET /profile_comments/1/edit
  def edit
    @profile_comment = ProfileComment.find(params[:id])
  end

  # POST /profile_comments
  # POST /profile_comments.json
  def create
    @profile_comment = ProfileComment.new(params[:profile_comment])

    respond_to do |format|
      if @profile_comment.save
        format.html { redirect_to @profile_comment, notice: 'Profile comment was successfully created.' }
        format.json { render json: @profile_comment, status: :created, location: @profile_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @profile_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profile_comments/1
  # PUT /profile_comments/1.json
  def update
    @profile_comment = ProfileComment.find(params[:id])

    respond_to do |format|
      if @profile_comment.update_attributes(params[:profile_comment])
        format.html { redirect_to @profile_comment, notice: 'Profile comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_comments/1
  # DELETE /profile_comments/1.json
  def destroy
    @profile_comment = ProfileComment.find(params[:id])
    @profile_comment.destroy

    respond_to do |format|
      format.html { redirect_to profile_comments_url }
      format.json { head :no_content }
    end
  end
end
