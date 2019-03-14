class CreateWorkingHours < ActiveRecord::Migration[5.2]
  def change
    create_table :working_hours do |t|
      t.integer :week_day
      t.datetime :start_time
      t.datetime :end_time
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
