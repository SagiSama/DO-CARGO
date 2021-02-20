module Base

class Shipment < ApplicationRecord
  has_many_attached :images

  validates :name, presence: true
  validates :delivery_date, presence: true

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
