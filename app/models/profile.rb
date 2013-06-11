class Profile < ActiveRecord::Base
  attr_accessible :birthday, :city, :first_name, :interests, :last_name, :location, :phone_number, :state, :image, :user_id, :about, :avatar_file1, :professionals_attributes
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 # has_attached_file :avatar, :storage => :database
  #has_attached_file :avatar,
  #                  :styles => { :thumb => "75x75>", :small => "150x150>" },
  #                  :url => '/:class/:id/:attachment?style=:style'

   #after_save :check_method
  def avatar_file1=(input_data)

    self.avatar_file = input_data.read
  end
   is_impressionable

  mount_uploader :image, ImageUploader
  has_many :professionals
  accepts_nested_attributes_for :professionals
  belongs_to :user
  include PublicActivity::Model
  tracked

  def complete_percentage()

    percentage = 0
    percentage += 20 if  interests.present?
    # if professional_industries.present?

    #   percentage += 10 if  professional_industries.aspirations.present?
    #   percentage += 10 if professional_industries.affiliations.present?
    # end
    #percentage += 30 if  user.educations.present?
    #percentage += 30 if  professional_industries.present?
    return percentage
  end

  def check_method
    raise self.changes.inspect
  end
end
