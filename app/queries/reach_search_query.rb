class ReachSearchQuery
  def initialize(term)
    @term = term
  end

  def to_relation
    Reach.
      joins("LEFT JOIN text_reaches ON content_type = 'TextReach' AND content_id = text_reaches.id").
      where("text_reaches.body LIKE ?", "%##{term}%")
  end

  private

  attr_reader :term
end
