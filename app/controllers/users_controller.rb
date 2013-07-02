class UsersController < ApplicationController
  before_filter :check_user_profile
  #helper_method :mailbox, :conversation
  def index
  end

  def public_profile
    @users = User.where("id != ? ", current_user.id)
    @followee =  current_user.user_followers
   end

  def follow

    Requesttomentor.create(:user_id => current_user.id, :following_id => params[:id], :status => 'pending')
    @users = User.where("id != ? ", current_user.id)
    #user = User.find(params[:id])
    #current_user.follow(user)
    @followee =  current_user.user_followers
  end

  def follow_profile
    @users = User.where("id != ? ", current_user.id)
    user = User.find(params[:id])
    current_user.follow(user)
    @followee =  current_user.user_followers
  end

  def unfollow_profile
    @users = User.where("id != ? ", current_user.id)
    user = User.find(params[:id])
    current_user.stop_following(user)
    @followee =  current_user.user_followers
  end

  def unfollow
    @users = User.where("id != ? ", current_user.id)
    user = User.find(params[:id])
    current_user.stop_following(user)
    @followee =  current_user.user_followers
  end

  def show_all_activity
    @more = PublicActivity::Activity.where("trackable_id != ? ", current_user.id).order('created_at desc')
  end

  def show
    @reqtomentor = Requesttomentor.where(following_id: current_user.id, status: 'pending').count
    #@activities = PublicActivity::Activity.where("trackable_id != ? ", current_user.id).limit(3)
    affiliation = current_user.profile.professionals
    education = current_user.profile.education
    @all_affilation = User.get_affliation(affiliation)
    @all_school = User.get_education(education)
    @posts = Post.where("user_id != ?", current_user.id)
    @following =  current_user.all_following.count
    @todos = Todo.where("user_id =?", current_user.id).order('created_at desc').limit(3)
    @follow = current_user.followers_count
    @current = Impression.where("impressionable_id = ? and DATE(created_at) = ?", current_user.profile.id, Date.today).count
    @past = Impression.where(impressionable_id: current_user.profile.id, created_at: 3.months.ago..1.day.ago).count
    @past_seven = Impression.where(impressionable_id: current_user.profile.id,created_at: 7.months.ago..1.day.ago).count
    reciver  = Receipt.where("receiver_id = ? and mailbox_type = ?", current_user.id, "inbox")
    current_user_company = User.get_current_company_name(current_user)
    unless  current_user_company.empty?

      @peer = Professional.where("company_name = ? and profile_id != ?",current_user_company, current_user.profile.id).count
    end
    @conversation = []
    if reciver
      reciver.each do |receiver|
        notification =  Notification.find(receiver.notification_id)
        @conversation.push(notification)
      end
    end
  end


  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def show_request
    @reqtomentor = Requesttomentor.where(following_id: current_user.id)
  end

  def accept_user
    user = User.find(params[:id])
    user.follow(current_user)
    reqtomentor = Requesttomentor.where(user_id: params[:id]).first
    reqtomentor.update_column(:status, 'approved')
    @reqtomentor = Requesttomentor.where(following_id: current_user.id, status: 'pending')
  end

end
