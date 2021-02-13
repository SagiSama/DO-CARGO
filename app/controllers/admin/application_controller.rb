module Admin

class ApplicationController < ApplicationController
  before_action :authenticate_admin!
  layout :monitoring_layout

  private

  def after_sign_in_path_for(resource)
    admin_shipments_path
  end

  def monitoring_layout
    'monitoring'
  end
end

end
