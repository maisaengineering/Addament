class GoalComment < ActiveRecord::Base
  attr_accessible :comment_description, :commenter_id, :goal_id
end
