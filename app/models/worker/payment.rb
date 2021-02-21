module Worker

class Payment < ApplicationRecord
  belongs_to :shipment

  belongs_to :created_worker, class_name: 'Base::Worker', foreign_key: :created_worker_id
  belongs_to :updated_worker, class_name: 'Base::Worker', foreign_key: :updated_worker_id

  enum payment_type: [ :account, :cash ]

  validates :shipment_id, presence: true
  validates :amount_paid, presence: true

  def self.search(params)
    result = Payment.joins(:shipment)

    if params[:code].present?
      result = result.where("shipments.code like '%#{params[:code]}%'")
    end

    if params[:amount_paid].present?
      result = result.where("payments.amount_paid = #{params[:amount_paid]}")
    end

    if params[:start_date].present?
      result = result.where("payments.created_at >= '#{params[:start_date]}'")
    end

    if params[:end_date].present?
      result = result.where("payments.created_at <= '#{params[:end_date]}'")
    end

    if params[:payment_type].present?
      result = result.where("payments.payment_type = #{params[:payment_type]}")
    end

    result = result.order('payments.updated_at desc, payments.created_at desc')

    return result
  end
end

end
