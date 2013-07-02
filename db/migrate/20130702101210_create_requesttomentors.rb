class CreateRequesttomentors < ActiveRecord::Migration
  def change
    create_table :requesttomentors do |t|
      t.integer :user_id
      t.integer :following_id
      t.string :status

      t.timestamps
    end
  end
end
