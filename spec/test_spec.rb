describe "Article" do
  require "rails_helper"

  feature "test" do
    before(:each) do
      @article = create(:article)
    end
  end
end
