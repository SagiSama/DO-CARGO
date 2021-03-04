module Worker

class PaymentsController < ApplicationController
  before_action :target_payment, except: %i[index new create]
  before_action :verify_role, except: %i[index new create edit shipment_payment]
  before_action :verify_role_shipment, only: :shipment_payment

  def index
    @payments = Payment.search(params).page(params[:page]).per(params[:limit])
  end

  def new
    @payment = Payment.new
  end

  def create
    create_params = payment_params.merge(created_worker_id: current_worker.id)
                                  .merge(updated_worker_id: current_worker.id)
    @payment = Payment.new(create_params)
    if @payment.save
      flash[:success] = t('global.save_success', subject: 'payment')
      redirect_to worker_payments_path
    else
      flash[:failure] = t('global.save_failure', subject: 'payment')
      render :new
    end
  end

  def edit
  end

  def update
    update_params = payment_params.merge(updated_worker_id: current_worker.id)
    if @payment.update(update_params)
      flash[:success] = t('global.save_success', subject: 'shipment')
      redirect_to worker_payments_path
    else
      flash[:failure] = t('global.save_failure', subject: 'shipment')
      render :edit
    end
  end

  def destroy
    @payment.destroy
    flash[:success] = t('global.save_success', subject: 'shipment')
    redirect_to worker_payments_path
  end

  def shipment_payment
    create_params = payment_params.merge(created_worker_id: current_worker.id)
                                  .merge(updated_worker_id: current_worker.id)
    @payment = Payment.new(create_params)
    if @payment.save
      flash[:failure] = nil
      flash[:success] = t('global.save_success', subject: 'payment')
    else
      flash[:success] = nil
      flash[:failure] = t('global.save_failure', subject: 'payment')
    end
    @payments = Payment.where(shipment_id: payment_params[:shipment_id]).order('created_at desc')
  end

  def shipment_payment_delete
    @payment.destroy
    flash[:success] = t('global.save_success', subject: 'payment')
    @payments = Payment.where(shipment_id: @payment.shipment_id).order('created_at desc')
  end

  private

  def target_payment
    @payment = Payment.find_by(id: params[:id])
  end

  def verify_role
    if !current_worker.manager? && @payment.created_worker_id != current_worker.id
      flash[:failure] = t('global.save_failure', subject: "only manager can modify other user's data")
      redirect_to worker_payments_path
    end
  end

  def verify_role_shipment
    shipment = Shipment.find_by(id: payment_params[:shipment_id])
    if !current_worker.manager? && shipment.created_worker_id != current_worker.id
      flash[:failure] = t('global.save_failure', subject: "only manager can modify other user's data")
      redirect_to worker_payments_path
    end
  end

  def payment_params
      params.require(:worker_payment).permit(:shipment_id,
                                             :amount_paid,
                                             :payment_type,
                                             :note)
    end

end

end
