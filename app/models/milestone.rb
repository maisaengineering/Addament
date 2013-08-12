class Milestone < ActiveRecord::Base
  attr_accessible :mile_Stone_step, :goal_id
  belongs_to :goal
  has_many :steps
end
