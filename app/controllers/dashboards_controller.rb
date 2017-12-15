class DashboardsController < ApplicationController
  def show
    @reach = Reach.new
    @reaches = current_user.timeline_reaches
  end
end
