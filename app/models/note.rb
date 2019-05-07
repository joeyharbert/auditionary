class Note < ApplicationRecord
  belongs_to :director
  belongs_to :time_slot
end
