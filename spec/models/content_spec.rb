require 'rails_helper'

RSpec.describe Content, type: :model do
  it "position、amazon_img、amazon_urlがあれば有効な状態であること" do
    expect(build(:content)).to be_valid
  end

  it "positionが無ければ無効な状態であること" do
    content = build(:content, position: nil)
    content.valid?
    expect(content.errors[:position]).to include("を入力してください")
  end

  describe '#content_img' do
    subject { content.content_img }
    context 'imgが存在する場合' do
      let(:content) { create(:content) }
      it '設定したimgが設定' do
        is_expected.to eq content.amazon_img
      end
    end
    context 'imgが存在しない場合' do
      let(:content) { create(:content, amazon_img: nil) }
      it 'no_photoが設定' do
        is_expected.to eq "/images/no_photo.jpg"
      end
    end
  end

  describe '#create_link' do
    subject { content.create_link }
    context 'linkが存在する場合' do
      let(:content) { create(:content) }
      it '設定したlinkが設定' do
        is_expected.to eq content.amazon_link
      end
    end
    context 'linkが存在しない場合' do
      let(:content) { create(:content, amazon_link: nil) }
      it 'エディットページへのlinkが設定' do
        is_expected.to eq "/users/#{content.user_id}/contents/#{content.position}/edit"
      end
    end
  end
end
