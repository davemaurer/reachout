class ReachSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    Reach.where(id: Reach.search { fulltext term }.hits.map(&:primary_key))
  end

  private

  attr_reader :term
end
