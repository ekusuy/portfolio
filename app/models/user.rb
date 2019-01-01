class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  validates :title, presence: true
  validates :title, length: { maximum: 25 }
  has_many :authentications, dependent: :destroy
  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :authentications

  def portfolio_creator?(current_user)
    # ユニークキーでの比較を実施
    self.twitter_id == current_user.twitter_id if current_user.present?
  end

  def twitter_user_info_updated?(twitter_user)
    name != twitter_user.name || twitter_icon != twitter_user.twitter_icon || twitter_url != twitter_user.twitter_url
  end
end
