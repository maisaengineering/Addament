class GoalCommentsController < ApplicationController
  # GET /goal_comments
  # GET /goal_comments.json
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => [:destroy, :update]
  def index

    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goal_comments }
    end
  end

  # GET /goal_comments/1
  # GET /goal_comments/1.json
  def show
    @goal_comment = GoalComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal_comment }
    end
  end

  # GET /goal_comments/new
  # GET /goal_comments/new.json
  def new
    @goal_comment = GoalComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal_comment }
    end
  end

  def add_goalcomment
    profile = Profile.find(params[:profile_id])
    GoalComment.create(:goal_id => params[:goal_comment][:goal_id], :commenter_id =>params[:goal_comment][:commenter_id], :comment_description => params[:goal_comment][:comment_description] )
    @goal = Goal.where(user_id: profile.user_id).order('created_at desc')
    @goal_comment = GoalComment.new
  end

  # GET /goal_comments/1/edit
  def edit
    @goal_comment = GoalComment.find(params[:id])
  end

  # POST /goal_comments
  # POST /goal_comments.json

  def create
    @goal_comment = GoalComment.new(params[:goal_comment])

    respond_to do |format|
      if @goal_comment.save
        #format.html { redirect_to @post, notice: 'Post was successfully created.' }
        #format.json { render json: @post, status: :created, location: @post }
        @goal_comment = Goal.new
        @goal = current_user.goals.order('created_at desc')
        @goal_comment = GoalComment.new
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goal_comments/1
  # PUT /goal_comments/1.json
  def update
    @goal_comment = GoalComment.find(params[:id])

    respond_to do |format|
      if @goal_comment.update_attributes(params[:goal_comment])
        format.html { redirect_to @goal_comment, notice: 'Goal comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_comments/1
  # DELETE /goal_comments/1.json
  def destroy
    @goal_comment = GoalComment.find(params[:id])
    @goal_comment.destroy

    respond_to do |format|
     #format.html { redirect_to about_profile_path }
      #format.json { head :no_content }
      @goal = current_user.goals.order('created_at desc')
      format.js
    end
  end
end
