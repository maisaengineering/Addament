class FeedbackController < ApplicationController
  before_filter :check_user_profile
  helper_method :mailbox, :conversation

  def new

  end
  def send_email

    if params[:current_form] == "users"  && params[:current_action] == "show"
      form_name = "Dashboard"
    elsif  params[:current_form] == "profiles"
      form_name = "profiles"
    elsif params[:current_form] == "conversations"
      form_name = "Messages"
    elsif params[:current_form] == "users" && params[:current_action] == "public_profile"
      form_name = "Public Profile"
    else
      form_name = "Path"
    end

    NotificationMailer.feedback_email(params[:email],params[:title], params[:category], params[:message], form_name).deliver
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
