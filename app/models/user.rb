class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  has_many :authentications, dependent: :destroy
  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :authentications

  def content_check
    self.contents.first.amazon_img.present?
  end
end
