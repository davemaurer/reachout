class ReachesController < ApplicationController
  def create
    reach = current_user.reaches.create(reach_params)
    redirect_to root_path, redirect_options_for(reach)
  end

  private

  def reach_params
    params.require(:reach).permit(:body)
  end

  def redirect_options_for(reach)
    if reach.persisted?
      { notice: "You reached out" }
    else
      { alert: "Failed to reach out"}
    end
  end
end
