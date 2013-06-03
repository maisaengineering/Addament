class UsersController < ApplicationController
  before_filter :check_user_profile
  #helper_method :mailbox, :conversation
  def index
  end

  def public_profile
  end

  def show
  	@user = current_user
    current_date = Time.now
    last_three_month = current_date - 3.months
    lat_seven_month = current_date - 7.months
    @current = Impression.where("impressionable_id = ? and created_at = ?", current_user.profile.id, current_date).count
    @past = Impression.where("impressionable_id = ? and created_at BETWEEN ? AND ?", current_user.profile.id, current_date, last_three_month).count
    reciver  = Receipt.where("receiver_id = ? and mailbox_type = ?", current_user.id, "inbox")
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
