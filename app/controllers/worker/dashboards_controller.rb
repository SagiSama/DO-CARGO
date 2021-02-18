module Worker

class DashboardsController < ApplicationController

  def index
    p '________INDEXX___ADMIN_DASHBOARD___________'
    @shipments = Shipment.all
  end
end

end
