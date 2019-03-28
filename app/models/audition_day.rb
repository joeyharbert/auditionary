class AuditionDay < ApplicationRecord
  has_many :time_slots, :proctors
  belongs_to :show, :company
end
