class Show < ApplicationRecord
  has_many :audition_days
  has_many :show_roles
end
