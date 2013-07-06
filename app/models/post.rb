class Post < ActiveRecord::Base
  attr_accessible :current_post, :user_id
  belongs_to :users
  has_many :comments, :dependent => :destroy
  validates_presence_of :current_post, :presence => true

end
