class Profile < ActiveRecord::Base
  attr_accessible :birthday, :city, :first_name, :interests, :last_name, :location, :phone_number, :state, :image, :user_id, :about, :avatar_file1, :professionals_attributes
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 # has_attached_file :avatar, :storage => :database
  #has_attached_file :avatar,
  #                  :styles => { :thumb => "75x75>", :small => "150x150>" },
  #                  :url => '/:class/:id/:attachment?style=:style'

   #after_save :check_method

   is_impressionable
  has_many :professionals
  has_many :education
  accepts_nested_attributes_for :professionals
  belongs_to :users
  include PublicActivity::Model
  tracked

  def avatar_file1=(input_data)

    self.avatar_file = input_data.read
  end

end
