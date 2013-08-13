class CreateOrgrequests < ActiveRecord::Migration
  def change
    create_table :orgrequests do |t|
      t.integer :user_id
      t.integer :org_id
      t.string :status

      t.timestamps
    end
  end
end
