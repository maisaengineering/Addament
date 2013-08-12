class OrganizationsProfessional < ActiveRecord::Base
   attr_accessible :organization_id, :professional_id
  belongs_to :organization
  belongs_to :professional
end
