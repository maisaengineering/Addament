class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :profile_id
      t.string :school
      t.date :date_attended
      t.string :degree
      t.string :field_of_study
      t.string :grade
      t.string :activities_and_societies
      t.text :description
      t.text :skills

      t.timestamps
    end
  end
end
