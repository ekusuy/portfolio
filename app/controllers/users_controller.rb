class UsersController < ApplicationController
  def show
    # FIXME: @userの実装はtwitterログイン実装後に変更する必要あり
    @user = User.find(params[:id])
    @contents = Content.where(user_id: @user.id) if @user
  end
end
