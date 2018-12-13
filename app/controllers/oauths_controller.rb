class OauthsController < ApplicationController
  def oauth
    login_at(params[:provider])
  end

  def callback
    # TODO：providerを判定するメソッドが必要。下記2つはとりあえず。
    provider = 'twitter'
    provider_name = 'twitter'
    @user = login_from(provider)
    # この時点でuser_attrs(@provider.user_info_mapping, @user_hash)にDBに必要なTwitter上のユーザー情報が入っている
    user_params = user_attrs(@provider.user_info_mapping, @user_hash)
    @user = User.new(user_params)
    if User.find_by(twitter_id: @user.twitter_id).present?
      @user = User.find_by(twitter_id: @user.twitter_id)
    else
    # ユーザーに紐づくコンテンツを9個生成
      (1..9).each{ |n| @user.contents.build(position: n) }
      @user.save
    end
    auto_login(@user)
    redirect_to users_path, notice: 'ログインしました'
  end
end
