class Content < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user

  def content_img
    amazon_img.present? ? amazon_img : '/images/no_photo.jpg'
  end

  def create_link
    amazon_link.present? ? amazon_link : edit_user_content_path(user_id, position)
  end
end
