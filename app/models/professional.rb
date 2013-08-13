class Professional < ActiveRecord::Base
  attr_accessible :achievements,:organization_id, :affiliations_array, :org_name, :author_tokens, :organization_id, :aspriations, :company_id, :companyname, :description, :end_date, :location, :professional_headline, :project_description, :project_end_date, :project_name, :project_start_date, :role, :start_date, :title, :profile_id
  belongs_to :profile
  belongs_to :company

  #has_and_belongs_to_many :oraganizations
  has_many :orgprofessions
  has_many :organizations, through: :orgprofessions
  #belongs_to :organization
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

  def affiliations_array=(input_data)
    orgnames = input_data.split(',')
    orgnames.compact!

    self.organizations.destroy(Organization.where(org_name:(affiliations-orgnames)))

    (orgnames-affiliations).each do |orgname|
      orgname.strip!
      org_find = Organization.find_by_org_name(orgname)
      if org_find

         Orgrequest.create(:user_id => self.profile.user_id, :org_id => org_find.id, :status => "pending")
      end
      self.organizations << Organization.find_or_create_by_org_name(orgname)
    end
  end

  def affiliations_array
    affiliations.join(', ')
  end

  def affiliations
    self.organizations.map(&:org_name)
  end


end
