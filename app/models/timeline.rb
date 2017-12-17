class Timeline
  def initialize(user)
    @user = user
  end

  def reaches
    Reach.where(user_id: timeline_ids)
  end

  private

  attr_reader :user

  def timeline_ids
    user.followed_user_ids + [user.id]
  end
end
