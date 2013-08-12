class CreateOrganizationsProfessionals < ActiveRecord::Migration
  def change
    create_table :organizations_professionals, :id => false do |t|

      t.integer :oraganization_id
      t.integer :professional_id
      t.timestamps
    end
  end
end
