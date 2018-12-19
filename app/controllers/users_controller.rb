class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @contents = Content.where(user_id: @user.id) if @user
  end

  def index
    # 最新の登録コンテンツをユーザー毎に取得
    @contents = Content.order(updated_at: :desc).to_a.uniq{ |c| c.user_id }
  end
end
