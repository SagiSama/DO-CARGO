module Admin

class Admin < ApplicationRecord
  devise :database_authenticatable
end

end
