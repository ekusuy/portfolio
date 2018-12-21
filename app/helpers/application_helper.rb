module ApplicationHelper
  def sns_account_link(user_twitter_url)
    "https://twitter.com/#{user_twitter_url}"
  end
end
