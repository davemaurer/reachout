class LikesController < ApplicationController
  def create
    current_user.like(reach)
    redirect_to root_path
  end

  private

  def reach
    @_reach ||= Reach.find(params[:id])
  end
end
