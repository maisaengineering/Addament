class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable
  validates :email, :presence => true, :uniqueness => true
  acts_as_messageable
  acts_as_followable
  acts_as_follower
 ROLES = %w(Mentor Mentee)
 # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :provider, :user_role
  serialize :user_role,Array
  has_one :profile
  has_many :todos
  has_many :posts
  has_many :goals, :dependent => :destroy
  has_many :my_activity

  def self.get_current_company_name(user_id)
    company = user_id.profile.professionals
    company.each do |get_company|
      if get_company.end_date==nil
         @current_company =  get_company.company_id
      end
    end
    return @current_company
  end
  # attr_accessible :title, :body
  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin, :google]
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new( :provider => auth.provider, :uid => auth.uid, :email => auth.info.email, :password => Devise.friendly_token[0,20])
      check_email = User.where(:email =>  user.email).first
      unless check_email
      user.skip_confirmation!
      user.save
        end
    end
    user
  end
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(:provider => auth.provider, :uid => auth.uid, :password => Devise.friendly_token[0,20])
      user.skip_confirmation!
      user.save
    end
     user
  end
  def self.find_for_linkedin_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new( :provider => auth.provider, :uid => auth.uid, :email => auth.info.email, :password => Devise.friendly_token[0,20])
      check_email = User.where(:email =>  user.email).first
      unless check_email
      user.skip_confirmation!
      user.save
        end
    end

    user
  end

  def self.find_for_google_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid, :email => auth.info.email).first
    unless user
      user = User.new(:provider => auth.provider, :uid => auth.uid, :email => auth.info.email, :password => Devise.friendly_token[0,20])
      check_email = User.where(:email =>  user.email).first
      unless check_email
      user.skip_confirmation!
      user.save
      end
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

  def self.check_post_count(user)
    all_users = User.where("id != ?", user.id)
    @user_post = Array.new
    all_users.each do |follow_user|
     if user.following?(follow_user)
       follow_user.posts.each do |post_message|

         @user_post.push(post_message)
       end
      end
    end


    return @user_post

  end


end
