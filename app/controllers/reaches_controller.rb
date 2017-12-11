class ReachesController < ApplicationController
  def show
    @reach = Reach.find(params[:id])
  end

  def create
    reach = current_user.reaches.create(reach_params)
    redirect_to root_path, redirect_options_for(reach)
  end

  private

  def reach_params
    { content: content_from_params }
  end

  def content_from_params
    TextReach.new(content_params)
  end

  def content_params
    params.require(:reach).require(:content).permit(:body)
  end

  def redirect_options_for(reach)
    if reach.persisted?
      { notice: "You reached out" }
    else
      { alert: "Failed to reach out"}
    end
  end
end
