class Education < ActiveRecord::Base
  attr_accessible :activities_and_societies, :date_attended, :degree, :description, :field_of_study, :grade, :school_id, :skills, :profile_id, :schoolname
  #attr_accessor :schoolname
  belongs_to :school
  belongs_to :profile

  def schoolname=(input_data)

    self.school = School.find_or_create_by_school_name(input_data) unless input_data.blank?

  end
  def schoolname

    self.school.school_name if school
  end
end
