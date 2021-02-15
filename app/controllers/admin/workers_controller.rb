module Admin

class WorkersController < ApplicationController
  before_action :target_worker, only: %i[show edit update]
  def index
  p '_____________________ADMIN WORKER INDEX____________________-'
    @workers = Worker.all
  end

  def show
  p '_____________________ADMIN WORKER SHOW____________________-'
  end

  def new
    p '_____________________ADMIN WORKER EDIT____________________-'
    @worker = Worker.new
  end

  def create
  p '_____________________ADMIN WORKER Create____________________-'
    @worker = Worker.new(worker_params)
    if @worker.save
#       flash[:success] = t('global.save_success', subject: Admin::Account.model_name.human)
      redirect_to admin_workers_path(@worker)
    else
#       flash[:failure] = t('global.save_failure', subject: Admin::Account.model_name.human)
      render :new
    end
  end

  def edit
  p '_____________________ADMIN WORKER EDIT____________________-'
  end

  def update
  p '_____________________ADMIN WORKER UPDATE____________________-'
    if @worker.update(worker_params)
      redirect_to admin_workers_path(@worker)
    else
      render :edit
    end
  end


  def destroy
    p '_____________________ADMIN WORKER DELTE____________________-'
    @worker = Worker.find_by(id: params[:id])
  end

  private

  def worker_params
    params.require(:admin_worker).permit(:name, :email)
  end

  def target_worker
    @worker = Worker.find_by(id: params[:id])
  end
end

end
