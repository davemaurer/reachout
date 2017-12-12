class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :reaches, dependent: :destroy
  has_many :likes
  has_many :liked_reaches, through: :likes, source: :reach

  def like(reach)
    liked_reaches << reach
  end

  def liked?(reach)
    liked_reach_ids.include?(reach.id)
  end
end
