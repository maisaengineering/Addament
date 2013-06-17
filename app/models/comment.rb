class Comment < ActiveRecord::Base
  attr_accessible :description, :post_id, :commenter_id
  belongs_to :posts
end
