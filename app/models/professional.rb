class Professional < ActiveRecord::Base
  attr_accessible :achievements, :affiliations, :aspriations, :company_name, :description, :end_date, :location, :professional_headline, :project_description, :project_end_date, :project_name, :project_start_date, :role, :start_date, :title, :profile_id
  belongs_to :profile
  include PublicActivity::Model
  #tracked
end
