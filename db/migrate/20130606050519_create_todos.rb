class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
          t.datetime :event_date
t.time :start_time
t.time :end_time
t.string :title
t.string :description
      t.timestamps
    end
  end
end
