class ContentsController < ApplicationController
  include AmazonSearchModule
  before_action :set_content, only: %i[edit update]
  before_action :authentication_check, only: %i[edit update position_update]

  def edit
    @results = search_item_from_amazon(params[:keyword])
  end

  def update
    if @content.update(content_params)
      redirect_to user_path(current_user), success: '商品を設定しました'
    else
      flash.now[:danger] = '商品が設定できませんでした'
      render :edit
    end
  end

  def position_update
    @user = User.find(params[:user_id])
    positions = params[:positions].map(&:to_i)
    @contents = @user.contents.order(:position)
    move_contents = []
    @contents.each.with_index(1) do |content, i|
      if positions[i] != content.position
        content.position = positions[i]
        move_contents << content
      end
    end
    @contents.import move_contents, on_duplicate_key_update: [:position]
    render json: positions
  end

    private
      def content_params
        params.permit(
          :amazon_img,
          :amazon_link
        )
      end

      def set_content
        @content = Content.find_by(user_id: params[:user_id], position: params[:position])
      end

      def authentication_check
        # 編集ページは作成者以外見れないように作成者IDとユーザIDをチェック
        redirect_to user_path(params[:user_id]), danger: '商品は作成者以外設定できません' unless logged_in? && current_user.id == params[:user_id].to_i
      end
end
