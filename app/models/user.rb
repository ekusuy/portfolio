class User < ApplicationRecord
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  has_many :authentications, dependent: :destroy
  has_many :contents, dependent: :destroy
  accepts_nested_attributes_for :authentications

  def portfolio_creater?(current_user)
    # ユニークキーでの比較を実施
    self.twitter_id == current_user.twitter_id if current_user.present?
  end
end
