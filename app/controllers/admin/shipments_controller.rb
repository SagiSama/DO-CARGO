module Admin

class ShipmentsController < ApplicationController
  def index
    @shipments = Shipment.all.limit(100)
  end
end

end
