module Worker

class DashboardsController < ApplicationController

  def index
    p '________INDEXX___ADMIN_DASHBOARD___________'
    @dashboard = {shipments: nil}
    @dashboard[:shipments] = Shipment.all
  end
end

end
