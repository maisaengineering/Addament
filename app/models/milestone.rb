class Milestone < ActiveRecord::Base
  attr_accessible :mile_Stone_step
  belongs_to :goal
end
