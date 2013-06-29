class Goal < ActiveRecord::Base
  attr_accessible :goal_name, :target_date, :user_id
  belongs_to :user
  has_many :milestones, :dependent => :destroy
  has_many :goal_comment, :dependent => :destroy
end
