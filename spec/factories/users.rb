FactoryBot.define do
  factory :user do
    name { "test" }
    twitter_id { "123" }
    twitter_icon { "https://abs.twimg.com/sticky/default_profile_images/default_profile_normal.png" }
    twitter_url { "ohmi_omi" }
    title { "クリックしてタイトルをつけて下さい" }
    factory :user_with_contents do
      # transientブロックでDBの属性とは関係ない属性を定義
      transient do
        contents_count { 9 }
      end

      # userに関連したcontentを作成する
      #   user - 作成されたuserインスタンス自身
      #   evaluator - transient内の属性を含むファクトリのすべての属性を保持
      #   create_listの第2引数は、作成する関連をもったレコードの数を指定する
      after(:create) do |user, evaluator|
        create_list(:content, evaluator.contents_count, user: user)
      end
    end
  end
end
