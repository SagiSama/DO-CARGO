module Admin

class Post < ApplicationRecord
  has_one_attached :image
end

end
