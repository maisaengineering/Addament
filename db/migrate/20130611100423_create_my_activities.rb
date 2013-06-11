class CreateMyActivities < ActiveRecord::Migration
  def change
    create_table :my_activities do |t|
      t.integer :user_id
      t.text :current_activity

      t.timestamps
    end
  end
end
