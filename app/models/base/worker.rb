module Base

class Worker < ApplicationRecord
  has_one_attached :avatar
end

end
