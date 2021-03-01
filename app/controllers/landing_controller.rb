class LandingController < ApplicationController
  def landing_page
    @top_sliders = Admin::Post.where(post_type: :top_slider, status: :active)
    @news = Admin::Post.where(post_type: :news, status: :active)
  end

  def track_shipment
    @shipment = Base::Shipment.find_by(code: params[:shipment_code])
  end
end
