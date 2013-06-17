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
    @users = User.where("id != ? ", current_user.id)
    user = User.find(params[:id])
    current_user.follow(user)
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
    #@activities = PublicActivity::Activity.where("trackable_id != ? ", current_user.id).limit(3)
    @posts = Post.all
    @following =  current_user.all_following.count
    @todos = Todo.where("user_id =?", current_user.id).order('created_at desc').limit(3)
    @follow = current_user.follow_count
    @current = Impression.where("impressionable_id = ? and DATE(created_at) = ?", current_user.profile.id, Date.today).count
    @past = Impression.where("impressionable_id = ? and DATE(created_at) = ? and DATE(created_at)<= ?", current_user.profile.id, Date.today, 3.months.ago).count
    @past_seven = Impression.where("impressionable_id = ? and DATE(created_at) = ? and DATE(created_at)<= ?", current_user.profile.id, Date.today, 7.months.ago).count
    reciver  = Receipt.where("receiver_id = ? and mailbox_type = ?", current_user.id, "inbox")
    current_user_company = User.get_current_company_name(current_user)
    @peer = Professional.where("company_name = ? and profile_id != ?",current_user_company, current_user.profile.id).count
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

end
