class CreateOrgprofessions < ActiveRecord::Migration
  def change
    create_table :orgprofessions do |t|
      t.integer :professional_id
      t.integer :organization_id

      t.timestamps
    end
  end
end
