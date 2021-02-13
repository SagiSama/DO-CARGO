module Worker

class ApplicationController < ApplicationController
  before_action :authenticate_worker!
  layout :monitoring_layout

  private

  def monitoring_layout
    'monitoring'
  end
end

end
