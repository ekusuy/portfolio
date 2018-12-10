class Content < ApplicationRecord
  belongs_to :user

  def img_check
    amazon_img.present? ? amazon_img : '/assets/sample.jpg'
  end
end
