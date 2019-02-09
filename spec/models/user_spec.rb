require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、ツイッターID、ツイッターアイコン、ツイッターURL、タイトルがあれば有効な状態であること" do
    expect(build(:user)).to be_valid
  end

  it "名前が無ければ無効な状態であること" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "twitterIDが無ければ無効な状態であること" do
    user = build(:user, twitter_id: nil)
    user.valid?
    expect(user.errors[:twitter_id]).to include("を入力してください")
  end

  it "twitterIDが同一なら無効な状態であること" do
    create(:user, twitter_id: "test")
    user = build(:user, twitter_id: "test")
    user.valid?
    expect(user.errors[:twitter_id]).to include("はすでに存在します")
  end

  it "twitterURLが無ければ無効な状態であること" do
    user = build(:user, twitter_url: nil)
    user.valid?
    expect(user.errors[:twitter_url]).to include("を入力してください")
  end

  it "タイトルが無ければ無効な状態であること" do
    user = build(:user, title: nil)
    user.valid?
    expect(user.errors[:title]).to include("を入力してください")
  end

  it "タイトルが25文字より上なら無効な状態であること" do
    user = build(:user, title: "a" * 26)
    user.valid?
    expect(user.errors[:title]).to include("は25文字以内で入力してください")
  end

  it "紐づいたコンテンツが9個あること" do
    user = create(:user_with_contents)
    expect(user.contents.length).to eq 9
  end

  # describe '#portfolio_creator?(current_user)' do
  #   let(:user) { create(:user) }
  #   # before do
  #   #   allow(controller).to receive(:current_user).and_return(user)
  #   # end
  #   subject { user.portfolio_creator?(current_user) }
  #   context 'ログインユーザと作成者のIDが同じ場合' do

  #     it '設定したimgが設定' do
  #       is_expected.to eq truety
  #     end
  #   end
  #   # context 'imgが存在しない場合' do
  #   #   let(:content) { create(:content, amazon_img: nil) }
  #   #   it 'no_photoが設定' do
  #   #     is_expected.to eq "/images/no_photo.jpg"
  #   #   end
  #   # end
  # end

  # def portfolio_creator?(current_user)
  #   # ユニークキーでの比較を実施
  #   self.twitter_id == current_user.twitter_id if current_user.present?
  # end

  # def twitter_user_info_updated?(twitter_user)
  #   name != twitter_user.name || twitter_icon != twitter_user.twitter_icon || twitter_url != twitter_user.twitter_url
  # end
end
