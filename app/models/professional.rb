class Professional < ActiveRecord::Base
  attr_accessible :achievements, :affiliations, :aspriations, :company_id, :companyname, :description, :end_date, :location, :professional_headline, :project_description, :project_end_date, :project_name, :project_start_date, :role, :start_date, :title, :profile_id
  belongs_to :profile
  belongs_to :company
  include PublicActivity::Model

 # validates_presence_of :companyname, :presence => true
  validate :start_must_be_before_end_date


   def start_must_be_before_end_date
     if  self.end_date.present?

       unless self.start_date < self.end_date

        errors.add(:end_date, " end date must be greater than start date")
       end
     end
   end
  #tracked
  def companyname=(input_data)

    self.company = Company.find_or_create_by_company_name(input_data) unless input_data.blank?

  end
  def companyname

    self.company.company_name if company
  end

end
