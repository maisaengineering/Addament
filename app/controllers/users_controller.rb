class UsersController < ApplicationController
  before_filter :check_user_profile
  def index
  end

  def public_profile
  end

  def show
  	@user = current_user
  end
end
