# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 開発用のユーザーデータ
# 50ユーザー作成
50.times do |n|
  User.create(name: "user_#{n}", twitter_id: "twitter_id_#{n}", twitter_url: "twitter_url_#{n}", twitter_icon: "https://pbs.twimg.com/profile_images/963249203639083008/7yEER84Q_normal.jpg")
end

# 50ユーザーが空のコンテンツ9個を生成し、その後positionが1のデータのみupdate
50.times do |n|
  @user = User.find_by(twitter_id: "twitter_id_#{n}")
  (1..9).each { |m| @user.contents.build(position: m) }
  @user.contents.update(
    position: "1",
    amazon_link: "https://www.amazon.co.jp/Kindle-Paperwhite%E3%80%81%E9%9B%BB%E5%AD%90%E6%9B%B8%E7%B1%8D%E3%83%AA%E3%83%BC%E3%83%80%E3%83%BC-%E7%AC%AC7%E4%B8%96%E4%BB%A3-%E3%80%81Wi-Fi-%E3%80%814GB%E3%80%81%E3%83%96%E3%83%A9%E3%83%83%E3%82%AF/dp/B00QJDOM6U?psc=1&amp;SubscriptionId=AKIAI7XJ5SLOQO4ZHZ5A&amp;tag=naoki0b-22&amp;linkCode=xm2&amp;camp=2025&amp;creative=165953&amp;creativeASIN=B00QJDOM6U",
    amazon_img: "https://images-fe.ssl-images-amazon.com/images/I/51mr3heFUaL.jpg")
  @user.save
end