class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :goal_id
      t.text :mile_Stone_step

      t.timestamps
    end
  end
end
