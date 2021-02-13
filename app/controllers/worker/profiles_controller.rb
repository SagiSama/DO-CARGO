module Worker

class ProfilesController < ApplicationController
  before_action :target_worker

  def show
  p '_____________________signded worker show____________________-'
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

  def target_worker
    @worker = Worker.find_by(id: current_worker.id)
  end

  def shipment_params
    params.require(:shipment).permit(:name, :note, :delivery_date)
  end
end

end
