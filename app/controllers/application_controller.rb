class ApplicationController < ActionController::Base
  protect_from_forgery
   layout :layout_by_resource

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
    profile = Profile.where(:user_id=> current_user.id).first
     unless profile
      redirect_to new_profile_path ,notice: "#{flash[:notice]} #{t(:profile_notice)}."
    end
    
  end
end
