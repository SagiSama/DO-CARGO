module Worker

class ApplicationController < ApplicationController
  before_action :authenticate_worker!
  layout :monitoring_layout

  private

  def after_sign_in_path_for(resource)
    worker_shipments_path
  end

  def monitoring_layout
    'monitoring'
  end
end

end
