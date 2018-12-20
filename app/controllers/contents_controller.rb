class ContentsController < ApplicationController
  include AmazonSearchModule
  before_action :set_content
  before_action :authentication_check

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
        redirect_to user_path(params[:user_id]), danger: '商品は作成者以外設定できません' unless logged_in? && current_user.id == @content.user_id
      end
end
