module Worker

class Shipment < Base::Shipment

  def self.search(params)
    result = Shipment.select('*')

    if params[:name].present?
      result = result.where("name like '%#{params[:name]}%'")
    end

    if params[:start_date].present?
      result = result.where("delivery_date >= '%#{params[:start_date]}%'")
    end

    if params[:end_date].present?
      result = result.where("delivery_date <= '%#{params[:end_date]}%'")
    end

    return result
  end
end

end
