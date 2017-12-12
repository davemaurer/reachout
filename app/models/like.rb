class Like < ApplicationRecord
  belongs_to :user
  belongs_to :reach

  validates :user_id, uniqueness: { scope: :reach_id }
end
