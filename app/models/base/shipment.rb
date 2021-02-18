module Base

class Shipment < ApplicationRecord
  has_many_attached :images
end

end
