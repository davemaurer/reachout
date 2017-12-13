class LikesController < ApplicationController
  before_action :require_login

  def create
    current_user.like(reach)
    redirect_to root_path
  end

  def destroy
    current_user.unlike(reach)
    redirect_to root_path
  end

  private

  def reach
    @_reach ||= Reach.find(params[:id])
  end
end
