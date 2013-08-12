class AddorddescToOrganization < ActiveRecord::Migration
  def up

      add_column :organizations, :org_description, :string
      execute 'ALTER TABLE organizations ADD COLUMN org_logo LONGBLOB'

  end

  def down
  end
end
