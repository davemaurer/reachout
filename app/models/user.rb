class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true, uniqueness: true

  has_many :reaches, dependent: :destroy
  has_many :likes
  has_many :liked_reaches, through: :likes, source: :reach

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship",
    dependent: :destroy
  has_many :followers, through: :follower_relationships

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_user_ids.include?(user.id)
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
