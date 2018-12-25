module ApplicationHelper
  def sns_account_link(user_twitter_url)
    "https://twitter.com/#{user_twitter_url}"
  end

  def sns_share_text(user)
    if user == current_user
      "#{user.title}を公開します！"
    else
      "#{user.name}さんの『#{user.title}』がすごい！"
    end
  end

  def current_page
    "#{url_for(only_path: false)}"
  end
end
