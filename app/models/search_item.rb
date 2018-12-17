class Search_item
  # プロパティの設定
  attr_accessor :title, :image_url, :url

  def initialize(title, image_url, url)
    @title = title
    @image_url = image_url
    @url = url
  end

  def update_params
    { amazon_img: "#{image_url}",
      amazon_link: "#{url}" }
  end
end
