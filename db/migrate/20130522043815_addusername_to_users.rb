class AddusernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :role, :boolean
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
end
