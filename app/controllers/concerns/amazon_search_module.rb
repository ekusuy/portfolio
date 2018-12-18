module AmazonSearchModule
  extend ActiveSupport::Concern

  def search_item_from_amazon(search_word)
    if search_word.present?
      # デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responseオブジェクトの取得
      results = Amazon::Ecs.item_search(
        search_word,
        search_index:  'All',
        dataType: 'script',
        response_group: 'ItemAttributes, Images',
        country:  'jp',
      )

      # 商品のタイトル,画像URL, 詳細ページURLの取得
      search_results = []
      results.items.each do |item|
        result = Search_item.new(
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
        )
        search_results << result
      end
      search_results
    end
  end
end
