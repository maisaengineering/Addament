class CreateProfileComments < ActiveRecord::Migration
  def change
    create_table :profile_comments do |t|
      t.integer :profile_id
      t.integer :commenter_id
      t.text :comment_description

      t.timestamps
    end
  end
end
