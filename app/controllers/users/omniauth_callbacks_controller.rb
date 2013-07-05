class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter { session.delete(:social_login_data) if session[:social_login_data]} #clear the session data}
def facebook

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    session[:social_login_data] = request.env["omniauth.auth"].info
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
           #session["devise.facebook_data"] = request.env["omniauth.auth"]
      flash[:notice] = "Email already exists"
      redirect_to new_user_registration_url
    end
  end

  def twitter

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)
    session[:social_login_data] = request.env["omniauth.auth"].info
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      #session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def linkedin

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)
    session[:social_login_data] = request.env["omniauth.auth"].info
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Linkedin") if is_navigational_format?
    else
      flash[:notice] = "Email already exists"
      #session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def google

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_google_oauth(request.env["omniauth.auth"], current_user)
    session[:social_login_data] = request.env["omniauth.auth"].info
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "google") if is_navigational_format?
    else
      #session["devise.twitter_data"] = request.env["omniauth.auth"]
      flash[:notice] = "Email already exists"
      redirect_to new_user_registration_url
    end
  end
end  