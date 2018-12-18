module AmazonSearchModule
  extend ActiveSupport::Concern

  def search_item_from_amazon(search_word)
    search_results = []
    return search_results if search_word.blank?
    # デバックログ出力オン
    Amazon::Ecs.debug = true
    # Amazon::Ecs::Responseオブジェクトの取得
    amazon_items = search_option(search_word)
    # 商品のタイトル,画像URL, 詳細ページURLの取得
    search_results = get_item_detail(amazon_items)
  end

  def search_option(search_word)
    Amazon::Ecs.item_search(
      search_word,
      search_index:  'All',
      dataType: 'script',
      response_group: 'ItemAttributes, Images',
      country:  'jp',
    )
  end

  def get_item_detail(results)
    search_item_details = []
    results.items.each do |item|
      result = Search_item.new(
        item.get('ItemAttributes/Title'),
        item.get('LargeImage/URL'),
        item.get('DetailPageURL'),
      )
      search_item_details << result
    end
    search_item_details
  end
end
