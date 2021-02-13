module Admin

class ApplicationController < ApplicationController
  before_action :authenticate_admin!
  layout :monitoring_layout

  private

  def monitoring_layout
    'monitoring'
  end
end

end
