class ShowRoleTimeSlot < ApplicationRecord
  belongs_to :show_role
  belongs_to :time_slot
end
