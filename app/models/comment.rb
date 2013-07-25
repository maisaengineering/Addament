class Comment < ActiveRecord::Base
  attr_accessible :description, :post_id, :commenter_id
  validates_presence_of :description, :presence => true
  belongs_to :posts
end
