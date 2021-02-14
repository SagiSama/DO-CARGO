module Admin

class DashboardsController < ApplicationController

  def index
    @workers = Worker::Worker.all
    @shipments = Shipment.all
  end
end

end
