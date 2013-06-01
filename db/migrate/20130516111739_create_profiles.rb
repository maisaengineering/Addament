class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :birthday
      t.string :location
      t.string :city
      t.string :state
      t.string :about
      t.string :interests

      t.timestamps
    end
  end
end
