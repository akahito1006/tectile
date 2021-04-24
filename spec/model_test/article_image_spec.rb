require "rails_helper"

RSpec.describe ArticleImage, "ArticleImageモデルに関するテスト", type: :model do
  before do
    FactoryBot.create(:article)
  end
  
  describe "画像データの保存" do
    it "有効なデータを保存できるか？" do
      expect(FactoryBot.build(:article_image)).to be_valid
    end
    
    context "空白のバリデーションチェック" do
      it "関連記事(article_id)が空の時、保存できない" do
        article_image = ArticleImage.new(article_id: "", image_id: Faker::Lorem.characters(number: 20))
        expect(article_image).to be_invalid
      end
      it "イメージ(image_id)が空の時、保存できない" do
        article_image = ArticleImage.new(article_id: 1, image_id: "")
        expect(article_image).to be_invalid
      end
    end
  end
end