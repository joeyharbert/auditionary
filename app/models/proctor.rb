class Proctor < User
  has_many :audition_day_proctors
  has_many :audition_days, through: :audition_day_proctors
end
