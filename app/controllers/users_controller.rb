class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]
  PER = 30

  def show
    @contents = Content.where(user_id: @user.id).order(position: :asc) if @user
  end

  def index
    # 最新の登録コンテンツをユーザー毎に取得
    @contents = Content.order(updated_at: :desc).to_a.uniq { |c| c.user_id }
    @contents_all = Kaminari.paginate_array(@contents).page(params[:page]).per(PER)
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.messages }, status: 422
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :title
      )
    end

    def set_user
      @user = User.find(params[:id])
    end
end
