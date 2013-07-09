class ApplicationController < ActionController::Base
  protect_from_forgery
   layout :layout_by_resource
  helper_method :mailbox, :conversation_layout
  # unless Rails.application.config.consider_all_requests_local
  #   rescue_from Exception,                            :with => :render_not_found
  #   rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
  #   rescue_from ActionController::RoutingError,       :with => :render_not_found
  #   rescue_from ActionController::UnknownController,  :with => :render_not_found
  #   rescue_from ActionController::UnknownAction,      :with => :render_not_found
  # end

    def render_not_found
      #render :template => "/error/404.html.erb", :status => 404
      flash[:notice] = "sorry the page you are looking is not found"
      redirect_to my_account_path
    end
  protected
 # Below method is used not to render layout for sign up pages
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

   def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
        if resource.is_a?(User)
          my_account_path
        else
          super
        end
  end
   def check_user_profile
    profile = Profile.where(user_id: current_user.id).first
     unless profile
      redirect_to new_profile_path ,notice: "#{flash[:notice]} #{t(:profile_notice)}."
    end
    
   end
  def mailbox
    @mailbox ||= current_user
  end

  def conversation_layout
    @conversation ||= mailbox.conversations.find(params[:id])

  end
end
