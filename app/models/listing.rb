class Listing < ApplicationRecord
  belongs_to :user 
  has_one_attached :image
  def img_url 
    image || picture_url
  end
end
