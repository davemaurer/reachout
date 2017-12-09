class ReachesController < ApplicationController
  def create
    current_user.reaches.create(reach_params)
    redirect_to root_path
  end

  private

  def reach_params
    params.require(:reach).permit(:body)
  end
end
