class AddUserIdToUserCalendars < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:user_calendars, :user_id)
      add_reference :user_calendars, :user, null: false, foreign_key: true
    end
  end
end
