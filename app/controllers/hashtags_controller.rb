class HashtagsController < ApplicationController
  def show
    @hashtag = params[:id]
    @results = ReachSearchQuery.new(term: "##{@hashtag}").to_relation
  end
end
