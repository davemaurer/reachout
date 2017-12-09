class DashboardsController < ApplicationController
  def show
    @reach = Reach.new
  end
end
