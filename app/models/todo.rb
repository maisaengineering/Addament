class Todo < ActiveRecord::Base
   attr_accessible :title, :description, :start_time, :end_time, :event_date, :user_id
  belongs_to :user
end
