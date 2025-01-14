class Event < ApplicationRecord
  belongs_to :user_calendar

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
