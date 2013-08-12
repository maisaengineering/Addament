class Orgprofession < ActiveRecord::Base
  attr_accessible :organization_id, :professional_id
  belongs_to :professional
  belongs_to :organization

end
