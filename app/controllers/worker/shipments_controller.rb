module Worker

class ShipmentsController < ApplicationController
  before_action :target_shipment, except: %i[index new create]
  before_action :verify_role, only: %i[update destroy]

  def index
    @shipments = Shipment.search(params).page(params[:page]).per(params[:limit])
  end

  def show
    @payments = Payment.where(shipment_id: @shipment.id).order('created_at desc')
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
    if @shipment.update({status: params[:status], status_history: "#{@shipment.status_history}, #{params[:status]}"})
      flash[:failure] = nil
      flash[:success] = t('global.save_success', subject: 'shipment')
    else
      flash[:success] = nil
      flash[:failure] = t('global.save_failure', subject: 'shipment')
    end
  end

  private

  def target_shipment
    @shipment = Shipment.find_by(id: params[:id])
  end

  def verify_role
    if !current_worker.manager? && @shipment.created_worker_id != current_worker.id
      flash[:failure] = t('global.save_failure', subject: "only manager can modify other user's data")
      redirect_to worker_shipments_path
    end
  end

  def shipment_params
    params.require(:worker_shipment).permit(:weight,
                                            :delivery_type,
                                            :shipment_type,
                                            :location_to,
                                            :location_from,
                                            :price,
                                            :status,
                                            :current_location,
                                            :shipment_definition,
                                            :shipment_object_description,
                                            :about_payment,
                                            :note,
                                            :delivery_date,
                                            :phone,
                                            :email,
                                            :customer_name,
                                            :customer_phone,
                                            :customer_address,
                                            :recipient_name,
                                            :recipient_phone,
                                            :recipient_address,
                                            images: [])
  end
end

end
