class FeedbackController < ApplicationController
  helper_method :mailbox, :conversation

  def new

  end
  def send_email
    NotificationMailer.feedback_email(params[:email],params[:title], params[:category], params[:message], params[:current_form]).deliver
    #NotificationMailer.customer_email(params[:email]).deliver
    redirect_to my_account_path
  end

  def change_priority

      
       update_priority = Receipt.find(params[:message_id])
      update_priority.update_column(:priority, params[:color])

  end

  def filter_data

    @profile_result = Profile.where("first_name like ? and user_id != ?", "%#{params[:search_value]}%", current_user.id)
    @company_name = Company.where("company_name like ?", "%#{params[:search_value]}%")

    @education = Education.where("school like ?", "%#{params[:search_value]}%")
     render :partial => "filter_data"
  end


end
