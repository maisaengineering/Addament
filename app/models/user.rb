class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
 acts_as_messageable
  acts_as_followable
  acts_as_follower
 ROLES = %w(Mentor Mentee)
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :provider, :user_role
  has_one :profile
  has_many :todos
  has_many :goals
  has_many :my_activity

  def self.get_current_company_name(user_id)
    company = user_id.profile.professionals
    company.each do |get_company|
      if get_company.end_date==nil
         @current_company =  get_company.company_name
      end
    end
    return @current_company
  end
  # attr_accessible :title, :body
  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin, :google]
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
      )
    end
    user
  end
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
       user = User.create(
          provider:auth.provider,
          uid:auth.uid,
          email:"praneetheee24@gmail.com",
          password:Devise.friendly_token[0,20]
      )
    end
    user
  end
  def self.find_for_linkedin_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
          provider:auth.provider,
          uid:auth.uid,
          email:auth.info.email,
          password:Devise.friendly_token[0,20]
      )
    end
    user
  end

  def self.find_for_google_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(
          provider:auth.provider,
          uid:auth.uid,
          email:auth.info.email,
          password:Devise.friendly_token[0,20]
      )
    end
    user
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
 def name
    email
  end
  
end
