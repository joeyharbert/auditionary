class TimeSlot < ApplicationRecord
  belongs_to :actor, optional: true
  belongs_to :audition_day
  has_many :show_role_time_slots
  has_many :show_roles, through: :show_role_time_slots
  enum sort: [:callback, :starred, :cast]
end
