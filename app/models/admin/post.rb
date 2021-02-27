module Admin

class Post < ApplicationRecord
  has_one_attached :image
  enum post_type: [:top_slider, :news, :team]
  validates :post_type, presence: true, inclusion: { in: post_types.keys }
end

end
