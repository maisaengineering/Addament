class AddorganizationidToProfessional < ActiveRecord::Migration
  def up
    rename_column :professionals, :affiliations, :organization_id
  end

  def down
  end
end
