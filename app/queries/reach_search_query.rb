class ReachSearchQuery
  def initialize(term:)
    @term = term
  end

  def to_relation
    matching_reaches_for_text_reaches.
      or(matching_reaches_for_photo_reaches)
  end

  private

  attr_reader :term

  def matching_reaches_for_text_reaches
    Reach.where(content_type: "TextReach", content_id: matching_text_reaches.select(:id))
  end

  def matching_text_reaches
    TextReach.where("text_reaches.body LIKE ?", "%#{term}%")
  end

  def matching_reaches_for_photo_reaches
    Reach.where(content_type: "PhotoReach", content_id: matching_photo_reaches.select(:id))
  end

  def matching_photo_reaches
    PhotoReach.where("image_file_name LIKE ?", "%#{term}%")
  end
end
