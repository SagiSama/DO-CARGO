module Base

class Worker < ApplicationRecord
  has_one_attached :avatar

  enum is_manager: [ :employee, :manager ]
end

end
