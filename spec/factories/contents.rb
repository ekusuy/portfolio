FactoryBot.define do
  factory :content do
    sequence(:position) { |n| "#{n}" }
    amazon_link { "https://www.amazon.co.jp/%E3%83%97%E3%83%AD%E3%82%92%E7%9B%AE%E6%8C%87%E3%81%99%E4%BA%BA%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AERuby%E5%85%A5%E9%96%80-%E8%A8%80%E8%AA%9E%E4%BB%95%E6%A7%98%E3%81%8B%E3%82%89%E3%83%86%E3%82%B9%E3%83%88%E9%A7%86%E5%8B%95%E9%96%8B%E7%99%BA%E3%83%BB%E3%83%87%E3%83%90%E3%83%83%E3%82%B0%E6%8A%80%E6%B3%95%E3%81%BE%E3%81%A7-Software-Design-plus%E3%82%B7%E3%83%AA%E3%83%BC%E3%82%BA/dp/4774193976?SubscriptionId=AKIAI7XJ5SLOQO4ZHZ5A&amp;tag=naoki0b-22&amp;linkCode=xm2&amp;camp=2025&amp;creative=165953&amp;creativeASIN=4774193976" }
    amazon_img { "https://images-fe.ssl-images-amazon.com/images/I/51nY-YLt2ZL.jpg" }
    association :user
  end
end
