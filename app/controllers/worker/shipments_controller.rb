module Worker

class ShipmentsController < ApplicationController
  before_action :target_shipment, except: %i[index new create]

  def index
    @shipments = Shipment.search(params).page(params[:page]).per(params[:limit])
    p '+++++++++++++++++++++++++++',@shipments.total_count
  end

  def show
  end

  def new
  p '_____________________WORKER new INDEX____________________-'
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new(shipment_params)
    if @shipment.save
      redirect_to worker_shipments_path
    else
      render :new
    end
  p '_____________________WORKER create INDEX____________________-'
  end

  def edit
  p '_____________________WORKER edit INDEX____________________-'
  end

  def update
  p '_____________________WORKER update INDEX____________________-'
    if @shipment.update(shipment_params)
      redirect_to worker_shipments_path
    else
      render :edit
    end
  end

  def destroy
  p '_____________________WORKER destroy INDEX____________________-'
    @shipment.destroy
    redirect_to worker_shipments_path
  end

  private

  def target_shipment
    @shipment = Shipment.find_by(id: params[:id])
  end

  def shipment_params
    params.require(:worker_shipment).permit(:name, :note, :delivery_date, images: [])
  end
end

end
