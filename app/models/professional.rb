class Professional < ActiveRecord::Base
  attr_accessible :achievements, :affiliations, :aspriations, :company_name, :description, :end_date, :location, :professional_headline, :project_description, :project_end_date, :project_name, :project_start_date, :role, :start_date, :title, :profile_id
  belongs_to :profile
  include PublicActivity::Model

 # validate :start_must_be_before_end_date


   def start_must_be_before_end_date
     errors.add(:end_date, " end date must be greater than start date")unless
         self.start_date < self.end_date
   end
  #tracked
end
