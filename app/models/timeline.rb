class Timeline
  def initialize(users, scope = Reach)
    @users = users
    @scope = scope
  end

  def reaches
    scope.
      where(user_id: users).
      order(created_at: :desc)
  end

  def to_partial_path
    "timelines/timeline"
  end

  private

  attr_reader :users, :scope
end
