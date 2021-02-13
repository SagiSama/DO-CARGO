module Worker

class ProfilesController < ApplicationController
  before_action :target_worker

  def show
  p '_____________________signded worker show____________________-'
  end

  def update
  p '_____________________signded worker upudate____________________-'
  end

  private

  def target_worker
    @worker = Worker.find_by(id: current_worker.id)
  end

  def worker_params
    params.require(:profile).permit(:name, :email, :delivery_date)
  end
end

end
