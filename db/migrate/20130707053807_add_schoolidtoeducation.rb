class AddSchoolidtoeducation < ActiveRecord::Migration
  def up
    rename_column :educations, :school, :school_id
  end

  def down
  end
end
