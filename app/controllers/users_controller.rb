class UsersController < ApplicationController
  before_action :require_login

  def show
    # FIXME: @userの実装はtwitterログイン実装後に変更する必要あり
    @user = current_user
    @contents = Content.where(user_id: @user.id) if @user
  end
end
