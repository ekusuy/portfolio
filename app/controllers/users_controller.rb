class UsersController < ApplicationController
  PER = 10

  def show
    @user = User.find(params[:id])
    @contents = Content.where(user_id: @user.id) if @user
  end

  def index
    # 最新の登録コンテンツをユーザー毎に取得
    @contents = Content.order(updated_at: :desc).to_a.uniq { |c| c.user_id }
    @contents_all = Kaminari.paginate_array(@contents).page(params[:page]).per(PER)
  end
end
