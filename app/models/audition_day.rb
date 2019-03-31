class AuditionDay < ApplicationRecord
  has_many :time_slots
  has_many :audition_day_proctors
  has_many :proctors, through: :audition_day_proctors
  has_many :audition_day_directors
  has_many :directors, through: :audition_day_directors
  belongs_to :show
  belongs_to :company
end
