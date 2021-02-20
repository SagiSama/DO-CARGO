module Worker

class ShipmentsController < ApplicationController
  before_action :target_shipment, except: %i[index new create]

  def index
    @shipments = Shipment.search(params).page(params[:page]).per(params[:limit])
  end

  def show
  end

  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new(shipment_params)
    if @shipment.save
      flash[:success] = t('global.save_success', subject: 'shipment')
      redirect_to worker_shipments_path
    else
      flash[:failure] = t('global.save_failure', subject: 'shipment')
      render :new
    end
  end

  def edit
  end

  def update
    if @shipment.update(shipment_params)
      flash[:success] = t('global.save_success', subject: 'shipment')
      redirect_to worker_shipments_path
    else
      flash[:failure] = t('global.save_failure', subject: 'shipment')
      render :edit
    end
  end

  def destroy
    @shipment.destroy
    flash[:success] = t('global.save_success', subject: 'shipment')
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
