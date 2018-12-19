class OauthsController < ApplicationController
  def oauth
    login_at(params[:provider])
  end

  def callback
    twitter_access_denied && return  if params[:denied].present?
    @user = login_from(params[:provider])
    # この時点でuser_attrs(@provider.user_info_mapping, @user_hash)にDBに必要なTwitter上のユーザー情報が入っている
    user_params = user_attrs(@provider.user_info_mapping, @user_hash)
    @user = User.new(user_params)
    if User.find_by(twitter_id: @user.twitter_id).present?
      @user = User.find_by(twitter_id: @user.twitter_id)
    else
      # ユーザーに紐づくコンテンツを9個生成
      (1..9).each { |n| @user.contents.build(position: n) }
      @user.save
    end
    auto_login(@user)
    redirect_to user_path(@user), success: 'ログインしました'
  end

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました'
  end

  private
    def twitter_access_denied
      redirect_to root_path, danger: 'ログインできませんでした'
      return true
    end
end
