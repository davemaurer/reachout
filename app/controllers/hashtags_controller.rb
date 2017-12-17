class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @results = Reach.joins("LEFT JOIN text_reaches ON content_type = 'TextReach' AND content_id = text_reaches.id").
     where("text_reaches.body LIKE ?", "%##{@hashtag}%")
  end
end
