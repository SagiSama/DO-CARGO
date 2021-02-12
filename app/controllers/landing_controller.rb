class LandingController < ApplicationController
  layout :landing_layout

  def landing_page
  end

  private

  def landing_layout
    'landing_page'
  end
end
