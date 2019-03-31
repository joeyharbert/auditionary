class Actor < User
  has_many :time_slots
  has_many :actor_show_roles
  has_many :show_roles, through: :actor_show_roles
end
