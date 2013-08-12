class Step < ActiveRecord::Base
  attr_accessible :step_description, :milestone_id
  belongs_to :milestone
end
