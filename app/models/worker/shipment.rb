module Worker

class Shipment < Base::Shipment

  validates :weight, presence: true
  validates :phone, presence: true
  validates :status, presence: true

  def self.search(params)
    result = Shipment.select('*')

    if params[:code].present?
      result = result.where("code like '%#{params[:code]}%'")
    end

    if params[:price].present?
      result = result.where("price = #{params[:price]}")
    end

    if params[:start_date].present?
      result = result.where("created_at >= '#{params[:start_date]}'")
    end

    if params[:end_date].present?
      result = result.where("created_at <= '#{params[:end_date]}'")
    end

    if params[:status].present?
      result = result.where("status = #{params[:status]}")
    end

    result = result.order('created_at desc')

    return result
  end
end

end
