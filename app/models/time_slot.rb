class TimeSlot < ApplicationRecord
  belongs_to :actor, :audition_day
  enum sort: [:callback, :starred, :cast]
end
