class Show < ApplicationRecord
  has_many :audition_days, :show_roles
end
