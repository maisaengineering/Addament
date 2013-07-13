class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  before_filter :check_user_profile
  def index
    @post = Post.new
    #@posts = Post.order('created_at desc')
    @comment = Comment.new
    @all_users = User.where("id != ?", current_user.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def comment_current_post
   # raise params[:id].inspect
   @post = Post.find(params[:id])
   @comment = Comment.new
  end

  def create_comment
    @comment = Comment.new(params[:comment])
    @comment.save
    #@post = Post.find(params[:comment][:post_id])
    #@comment = Comment.new
    #render :js=>"alert('ok')"
  end

  def follow_from_post
    Requesttomentor.create(:user_id => current_user.id, :following_id => params[:id], :status => 'pending')
    @users = User.where("id != ? ", current_user.id)
    @all_users = User.where("id != ?", current_user.id)

  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        #format.html { redirect_to @post, notice: 'Post was successfully created.' }
        #format.json { render json: @post, status: :created, location: @post }
        @post = Post.new
        @posts = Post.order('created_at desc')
        @comment = Comment.new
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
