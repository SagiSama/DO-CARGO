module Admin

class ApplicationController < ApplicationController
  before_action :authenticate_admin!

  def after_sign_in_path_for(resource)
    admin_shipments_path
  end
end

end
