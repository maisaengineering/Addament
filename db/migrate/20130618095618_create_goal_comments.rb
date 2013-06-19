class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id
      t.integer :commenter_id
      t.text :comment_description

      t.timestamps
    end
  end
end
