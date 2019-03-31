class Director < User
  has_many :shows
  has_many :audition_day_directors
  has_many :audition_days, through: :audition_day_directors

end
