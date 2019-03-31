class ShowRole < ApplicationRecord
  belongs_to :show
  has_many :actor_show_roles
  has_many :actors, through: :actor_show_roles
end
