class Content < ApplicationRecord
  belongs_to :user

  def content_img
    amazon_img.present? ? amazon_img : 'sample.jpg'
  end

  def create_link
    amazon_link.present? ? amazon_link :
    Rails.application.routes.url_helpers.edit_user_content_path(user_id, position)
  end
end
