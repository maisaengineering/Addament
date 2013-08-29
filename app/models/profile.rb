class Profile < ActiveRecord::Base
  attr_accessible :birthday, :city, :first_name,  :last_name, :location, :phone_number, :state, :image, :user_id, :about, :avatar_file1, :cal_age, :professionals_attributes
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 # has_attached_file :avatar, :storage => :database
  #has_attached_file :avatar,
  #                  :styles => { :thumb => "75x75>", :small => "150x150>" },
  #                  :url => '/:class/:id/:attachment?style=:style'

   #after_save :check_method
  #validates :first_name,  :uniqueness => {:message => "Name already exists"}
  INTEREST = %w(cricket politics)
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

end
