module Worker

class ShipmentsController < ApplicationController
  before_action :target_shipment, only: %i[edit update]

  def index
  p '_____________________WORKER shipments INDEX____________________-'
    @shipments = Shipment.all
  end

  def new
  p '_____________________WORKER new INDEX____________________-'
  end

  def create
  p '_____________________WORKER create INDEX____________________-'
  end

  def edit
  p '_____________________WORKER edit INDEX____________________-'
  end

  def update
  p '_____________________WORKER update INDEX____________________-'
  end

  def destroy
  p '_____________________WORKER destroy INDEX____________________-'
  end

  private

  def target_shipment
    @target_shipment = Shipment.all
  end

  def shipment_params
    params.require(:shipment).permit(:name, :note, :delivery_date)
  end
end

end
