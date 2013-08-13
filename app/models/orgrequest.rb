class Orgrequest < ActiveRecord::Base
  attr_accessible :org_id, :status, :user_id
  belongs_to :user
end
