module Worker

class ApplicationController < ApplicationController
  before_action :authenticate_worker!
  layout :monitoring_layout

  private

  def monitoring_layout
    'worker/layout'
  end
end

end
