class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :milestone_id
      t.string :step_description

      t.timestamps
    end
  end
end
