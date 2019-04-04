class ShowRole < ApplicationRecord
  belongs_to :show
  has_many :actor_show_roles
  has_many :actors, through: :actor_show_roles
  has_many :show_role_time_slots
  has_many :time_slots, through: :show_role_time_slots
end
