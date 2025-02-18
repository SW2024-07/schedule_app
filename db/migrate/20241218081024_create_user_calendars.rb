class CreateUserCalendars < ActiveRecord::Migration[7.1]
  def change
    create_table :user_calendars do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
