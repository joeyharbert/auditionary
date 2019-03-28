class User < ApplicationRecord
  enum union_status: [:non_union, :emc, :equity]
end
