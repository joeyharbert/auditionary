class User < ApplicationRecord
  enum union_status: [:non_union, :emc, :equity]
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
