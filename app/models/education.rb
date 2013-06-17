class Education < ActiveRecord::Base
  attr_accessible :activities_and_societies, :date_attended, :degree, :description, :field_of_study, :grade, :school_id, :skills, :profile_id
  belongs_to :profile
end
