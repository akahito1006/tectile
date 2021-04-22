describe '四則演算' do
  context '足し算' do
    it "1+1は2" do
      expect(1 + 2).to eq 2
    end
  end

  context '足し算' do
    it "1+2は3" do
      expect(1 + 2).to eq 3
    end
  end
end

describe "Article" do
  require "rails_helper"

  feature "test" do
    before(:each) do
      @article = create(:article)
    end
  end
end
