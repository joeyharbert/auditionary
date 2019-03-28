class TimeSlot < ApplicationRecord
  belongs_to :actor
  enum sort: [:callback, :starred, :cast]
end
