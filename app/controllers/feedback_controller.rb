class FeedbackController < ApplicationController
  helper_method :mailbox, :conversation

  def new

  end
  def send_email

    NotificationMailer.feedback_email(params[:email],params[:title], params[:category], params[:message]).deliver
    #NotificationMailer.customer_email(params[:email]).deliver
    redirect_to my_account_path
  end

  def change_priority
       update_priority = Notification.where("conversation_id = ?", params[:conversation_id]).first
       update_priority.update_column(:priority, params[:priority])
       @conversation ||= mailbox.conversations.find(params[:conversation_id])
    #raise update_priority.inspect
  end

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:conversation_id])
  end
end
