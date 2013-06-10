class Todo < ActiveRecord::Base
   attr_accessible :title, :description, :start_time, :end_time, :event_date, :user_id
  belongs_to :user
   validate :start_must_be_before_end_time


   def start_must_be_before_end_time
     errors.add(:end_time, " end time must be greater than start time")unless
         self.start_time < self.end_time
   end
end
