class Company < ActiveRecord::Base
  attr_accessible :company_name
  has_many :professionals
end
