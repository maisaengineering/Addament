class Organization < ActiveRecord::Base
  attr_accessible :org_admin_email, :org_name, :org_description, :org_url, :org_logo1, :user_id
  belongs_to :users
  #has_many :professionals
  #has_and_belongs_to_many :professionals
  has_many :orgprofessions
  has_many :professionals, through: :orgprofessions
  #validates_format_of :org_admin_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_presence_of :org_name, :presence => true
  #validates_presence_of :org_url, :presence => true


  def org_logo1=(input_data)

    self.org_logo = input_data.read
  end
end
