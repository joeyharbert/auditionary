class AuditionDayProctor < ApplicationRecord
  belongs_to :audition_day
  belongs_to :proctor
end
