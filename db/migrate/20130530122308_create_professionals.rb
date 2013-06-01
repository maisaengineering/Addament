class CreateProfessionals < ActiveRecord::Migration
  def change
    create_table :professionals do |t|
      t.string :company_name
      t.string :title
      t.string :location
      t.string :role
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :professional_headline
      t.text :aspriations
      t.text :achievements
      t.text :affiliations
      t.string :project_name
      t.date :project_end_date
      t.date :project_start_date
      t.text :project_description
      t.integer :profile_id

      t.timestamps
    end
  end
end
