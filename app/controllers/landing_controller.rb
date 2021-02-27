class LandingController < ApplicationController
  def landing_page
  end

  def track_shipment
    @shipment = Base::Shipment.find_by(code: params[:shipment_code])
  end
end
