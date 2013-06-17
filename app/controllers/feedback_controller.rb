class FeedbackController < ApplicationController

  def new

  end
  def send_email

    NotificationMailer.feedback_email(params[:email],params[:title], params[:category], params[:message]).deliver
    #NotificationMailer.customer_email(params[:email]).deliver
    redirect_to my_account_path
  end
end
