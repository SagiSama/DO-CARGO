module Worker

class ApplicationController < ApplicationController
  before_action :authenticate_worker!

  def after_sign_in_path_for(resource)
    worker_shipments_path
  end
end

end
