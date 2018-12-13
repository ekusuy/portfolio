class Content < ApplicationRecord
<<<<<<< HEAD
=======
  belongs_to :user

  def content_img
    amazon_img.present? ? amazon_img : 'sample.jpg'
  end
>>>>>>> bcbbf22cab4ab1267cab2c3c86097e0d93f243fe
end
