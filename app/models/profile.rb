class Profile < ActiveRecord::Base
  attr_accessible :birthday, :city, :first_name, :interests, :last_name, :location, :phone_number, :state, :image, :user_id, :about, :professional_attributes
  mount_uploader :image, ImageUploader
  has_many :professional
  accepts_nested_attributes_for :professional
  belongs_to :user

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
