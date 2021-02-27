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
    create_params = shipment_params.merge(status_history: params[:worker_shipment][:status])
                                   .merge(created_worker_id: current_worker.id)
                                   .merge(updated_worker_id: current_worker.id)
    @shipment = Shipment.new(create_params)
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
    update_params = shipment_params.except(:status)
                                   .merge(updated_worker_id: current_worker.id)
    if @shipment.update(update_params)
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

  def state_shipment
    @shipment = Shipment.find_by(id: params[:shipment_id])
    if @shipment.update({status: params[:status], status_history: "#{@shipment.status_history}, #{params[:status]}"})
      flash[:success] = t('global.save_success', subject: 'shipment')
    else
      flash[:failure] = t('global.save_failure', subject: 'shipment')
    end
  end

  private

  def target_shipment
    @shipment = Shipment.find_by(id: params[:id])
  end

  def shipment_params
    params.require(:worker_shipment).permit(:shipment_definition,
                                            :shipment_object_description,
                                            :about_payment,
                                            :price,
                                            :note,
                                            :delivery_date,
                                            :phone,
                                            :status,
                                            :customer_phone,
                                            :recipient_phone,
                                            :email,
                                            :customer_name,
                                            :recipient_name,
                                            :location_from,
                                            :location_to,
                                            :delivered_date,
                                            images: [])
  end
end

end
