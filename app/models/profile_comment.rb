class ProfileComment < ActiveRecord::Base
  attr_accessible :comment_description, :commenter_id, :profile_id
  validates_presence_of :comment_description, :presence => true
end
