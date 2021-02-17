module Worker

class ProfilesController < ApplicationController
  before_action :target_worker

  def show
  p '_____________________signded worker show____________________-'
  end

  def edit
  p '_____________________signded worker edit____________________-'
  end

  def update
  p '_____________________signded worker upudate____________________-'
    if @profile.update(profile_params)
      redirect_to worker_profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def target_worker
    @profile = Worker.find_by(id: current_worker.id)
  end

  def profile_params
    params.require(:worker_worker).permit(:name, :email, :delivery_date, :avatar)
  end
end

end
