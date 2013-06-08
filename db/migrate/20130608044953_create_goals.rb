class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :goal_name
      t.date :target_date

      t.timestamps
    end
  end
end
