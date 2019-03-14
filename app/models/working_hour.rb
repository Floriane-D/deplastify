class WorkingHour < ApplicationRecord
  belongs_to :store
  validates :week_day, presence: true
end
