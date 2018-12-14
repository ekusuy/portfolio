class ContentsController < ApplicationController
  before_action :set_content
  before_action :authentication_check

  def edit
    if params[:keyword].present?
      # デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      contents = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'All',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
      )

      # 商品のタイトル,画像URL, 詳細ページURLの取得
      @contents = []
      contents.items.each do |item|
        content = Search_item.new(
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
        )
        @contents << content
      end
    end
  end

  def update
    if @content.update(content_params)
      redirect_to user_path(current_user), success: t('画像を設定しました')
    else
      flash.now[:danger] = t('画像が設定できませんでした')
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
        # 編集権限があるかチェック
        redirect_to user_path(params[:user_id]), danger: t('このページをみる権限がありません') unless logged_in? && current_user.id == @content.user_id
      end
end
