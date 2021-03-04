module Base

class Shipment < ApplicationRecord

  has_many_attached :images

  enum delivery_type: [ :land, :air ]
  enum shipment_type: [ :normal, :express ]
  enum location_to: [ :ULN, :ISN ], _suffix: :to
  enum location_from: [ :ISN, :ULN ], _suffix: :from
  enum current_location: [ :in_korea_stock, :in_shipment, :in_bonded_storage, :waited_in_bonded_storage, :in_mongolia_stock, :delivered ]
  enum status: [ :registered, :delivering, :paid, :done ]

  belongs_to :created_worker, class_name: 'Base::Worker', foreign_key: :created_worker_id
  belongs_to :updated_worker, class_name: 'Base::Worker', foreign_key: :updated_worker_id

  after_initialize :preview_code
  after_create :set_code

  private

  def preview_code
    if self.new_record?
      sql = "select last_value from shipments_id_seq limit 1"
      record = ActiveRecord::Base.connection.execute(sql)
      self.code = format('SP%04d', (record.first['last_value'] + 1))
    end
  end

  def set_code
    self.update(:code => format('SP%04d', id))
  end
end

end
