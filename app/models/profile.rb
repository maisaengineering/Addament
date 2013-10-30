class Profile < ActiveRecord::Base
  extend FriendlyId
  friendly_id :first_name
  attr_accessible :birthday, :city, :first_name,  :last_name, :location, :phone_number, :state, :image, :user_id, :about, :avatar_file1, :cal_age, :professionals_attributes
  INTEREST = ["Topstories","Worldnews","U.S.News","Business","Technology","Entertainment","Sports","Science","Health"]
  serialize :interests,Array
  attr_accessible :interests
   is_impressionable
  has_many :professionals
  has_many :education
  accepts_nested_attributes_for :professionals
  belongs_to :users
  include PublicActivity::Model
  tracked
  validates_presence_of :first_name,:last_name, :birthday, :presence => true
  scope :get_profile, ->(location, user) { where("location like ? or id != ?", "%#{location}%", user)}
  def avatar_file1=(input_data)

    self.avatar_file = input_data.read
  end

  def cal_age=(age_data)
    today_now = Time.now
    current_year = today_now.year
    if birthday.present?
    birth = birthday.to_date
      self.age = current_year - birth.year
    end

  end
  def cal_age

    self.age if age
  end

  def to_param
    "#{first_name}".parameterize
  end

end
