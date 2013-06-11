class MyActivity < ActiveRecord::Base
  attr_accessible :current_activity, :user_id
  belongs_to :users
end
