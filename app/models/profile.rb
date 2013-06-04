class Profile < ActiveRecord::Base
  is_impressionable

  attr_accessible :birthday, :city, :first_name, :interests, :last_name, :location, :phone_number, :state, :image, :user_id, :about, :professionals_attributes
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
end
