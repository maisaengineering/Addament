class School < ActiveRecord::Base
  attr_accessible :school_name
  has_many :educations
end
