class Goal < ActiveRecord::Base
  attr_accessible :goal_name, :target_date, :user_id
  belongs_to :user
  has_many :milestones, :dependent => :destroy
end
