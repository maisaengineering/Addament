class AddAttachmentsBlobAvatarToProfile < ActiveRecord::Migration
  def self.up
    execute 'ALTER TABLE profiles ADD COLUMN avatar_file LONGBLOB'
    execute 'ALTER TABLE profiles ADD COLUMN avatar_small_file LONGBLOB'
    execute 'ALTER TABLE profiles ADD COLUMN avatar_thumb_file LONGBLOB'
  end

  def self.down
    remove_column :profiles, :avatar_file
    remove_column :profiles, :avatar_small_file
    remove_column :profiles, :avatar_thumb_file
  end
end
