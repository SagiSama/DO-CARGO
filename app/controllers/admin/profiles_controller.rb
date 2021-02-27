module Admin

class ProfilesController < ApplicationController
  def show
    @profile = Admin.find_by(id: current_admin.id)
  end
end

end
