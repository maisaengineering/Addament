class AddageToProfiles < ActiveRecord::Migration
  def up
    add_column :profiles, :age, :integer
  end

  def down
  end
end
