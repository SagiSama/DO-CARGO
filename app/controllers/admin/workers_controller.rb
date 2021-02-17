module Admin

class WorkersController < ApplicationController
  before_action :target_worker, except: %i[index new create]

  def index
    @workers = Worker.all
  end

  def show
  end

  def new
    @worker = Worker.new
  end

  def create
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
  end

  def update
    if @worker.update(worker_params)
      redirect_to admin_workers_path(@worker)
    else
      render :edit
    end
  end

  def destroy
    @worker.destroy
    redirect_to admin_workers_path
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
