class ProfileComment < ActiveRecord::Base
  attr_accessible :comment_description, :commenter_id, :profile_id
end
