class OauthsController < ApplicationController
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = 'twitter'
    provider_name = 'twitter'
    binding.pry
    if @user = login_from(provider)
      redirect_to login_path, notice: 'ログインに成功しました'
    else
      begin
        binding.pry
        @user = create_from(provider)
        # この時点でuser_attrs(@provider.user_info_mapping, @user_hash)にTwitterでのユーザー情報が入っている
        # 以降はrescueに遷移される
        reset_session
        auto_login(@user)
        redirect_to login_path, notice: 'ユーザーを作成しました'
      rescue
        binding.pry
        redirect_to login_path, notice: 'ログインに失敗しました'
      end
    end
  end

end
