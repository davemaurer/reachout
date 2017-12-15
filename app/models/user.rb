class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :reaches, dependent: :destroy
  has_many :likes
  has_many :liked_reaches, through: :likes, source: :reach
  has_many :following_relationships, foreign_key: :follower_id
  has_many :followed_users, through: :following_relationships

  def follow(user)
    followed_users << user
  end

  def like(reach)
    liked_reaches << reach
  end

  def unlike(reach)
    liked_reaches.destroy(reach)
  end

  def liked?(reach)
    liked_reach_ids.include?(reach.id)
  end

  def to_param
    username
  end
end
