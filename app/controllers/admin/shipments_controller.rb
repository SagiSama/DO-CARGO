module Admin

class ShipmentsController < ApplicationController
  before_action :target_shipment, only: %i[edit update]

  def index
  p '_____________________ADMIN shipments INDEX____________________-'
    @shipments = Shipment.all
  end

  def new
  p '_____________________ADMIN new INDEX____________________-'
  end

  def create
  p '_____________________ADMIN create INDEX____________________-'
  end

  def edit
  p '_____________________ADMIN edit INDEX____________________-'
  end

  def update
  p '_____________________ADMIN update INDEX____________________-'
  end

  def destroy
  p '_____________________ADMIN destroy INDEX____________________-'
  end

  private

  def target_shipment
    @target_shipment = Shipment.find_by(id: params[:id])
  end

  def shipment_params
    params.require(:shipment).permit(:name, :note, :delivery_date)
  end
end

end
