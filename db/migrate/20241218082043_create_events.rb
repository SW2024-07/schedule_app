class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.references :user_calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
