class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :org_name
      t.string :org_url
      t.string :org_admin_email
      t.integer :user_id

      t.timestamps
    end
  end
end
