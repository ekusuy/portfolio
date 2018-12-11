class Content < ApplicationRecord
  belongs_to :user

  def content_img
    amazon_img.present? ? amazon_img : 'sample.jpg'
  end
end
