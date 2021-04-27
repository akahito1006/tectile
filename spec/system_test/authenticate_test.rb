require "rails_helper"

describe "[0]ログイン前のテスト"  do
  before do
    visit "/"
  end
  
  context "トップ画面" do
    it "URLが正しい" do
      expect(current_path).to eq "/"
    end
    it "ロゴがトップページへのリンクである" do
      find(".logo").click
      expect(current_path).to eq "/"
    end
  end
  
  context "about画面" do
    it "URLが正しい" do
      click_on "About"
      expect(current_path).to eq "/about"
    end
  end
  
  context "記事リスト画面" do
    before do
      FactoryBot.create(:user)
      FactoryBot.create(:article)
      FactoryBot.create(:article_image)
    end
    it "URLが正しい" do
      click_on "記事リスト"
      expect(current_path).to eq "/articles"
    end
  end
  
  context "ログイン画面" do
    it "会員ログイン・URLが正しい" do
      click_on "ログイン"
      expect(current_path).to eq "/users/sign_in"
    end
    it "管理者ログイン・URLが正しい" do
      click_on "管理者ログイン"
      expect(current_path).to eq "/admin/sign_in"
    end
  end
  
  context "検索結果画面" do
    it "検索する→検索結果画面" do
      find("#navbarsearch").click
      click_on "Search"
      expect(current_path).to eq "/search"
    end
  end
  
  context "権限のないページへのアクセス" do
    it "会員ログイン前に新規投稿画面に遷移できない" do
      visit "/articles/new"
      expect(current_path).to eq "/users/sign_in"
    end
    it "管理者ログイン前に会員一覧に遷移できない" do
      visit "/admin/users"
      expect(current_path).to eq "/admin/sign_in"
    end
  end
end

describe "[1]会員ログイン後のテスト"  do
  before do
    visit "/"
    click_on "ログイン"
    click_on "ゲストログイン"
    FactoryBot.create(:article)
    FactoryBot.create(:article_image)
  end
  
  context "トップ画面" do
    it "URLが正しい" do
      expect(current_path).to eq "/"
    end
    it "ロゴがトップページへのリンクである" do
      find(".logo").click
      expect(current_path).to eq "/"
    end
    it "ユーザーネームが表示される" do
      expect(page).to have_content "ようこそ、testuser1様"
    end
  end
  
  context "マイページ" do 
    it "URLが正しい" do
      click_on "マイページ"
      expect(current_path).to eq "/users/1"
    end
    it "会員情報編集ボタンがある" do
      visit "/users/1"
      expect(page).to have_content "会員情報を編集する"
      click_on "会員情報を編集する"
      expect(current_path).to eq "/users/1/edit"
    end
    it "記事編集ボタンがある" do
      visit "/users/1"
      expect(page).to have_content "編集する"
      click_on "編集する"
      expect(current_path).to eq "/articles/1/edit"
    end
    it "記事削除ボタンがある" do
      visit "/users/1"
      expect(page).to have_content "削除する"
      click_on "削除する"
      expect(current_path).to eq "/articles"
    end
  end
  
  context "記事リスト画面" do
    before do
      FactoryBot.create(:article)
      FactoryBot.create(:article_image)
    end
    it "URLが正しい" do
      click_on "記事リスト"
      expect(current_path).to eq "/articles"
    end
  end
  
  context "検索結果画面" do
    it "検索する→検索結果画面" do
      find("#navbarsearch").click
      click_on "Search"
      expect(current_path).to eq "/search"
    end
  end
  
  context "新規投稿画面" do
    it "投稿する→新規作成画面" do
      click_on "投稿する"
      expect(current_path).to eq "/articles/new"
      expect(page).to have_field "article[title]"
      expect(page).to have_field "article[content]"
      expect(page).to have_field "article[article_images_images][]"
      expect(page).to have_button "記事を作成する"
    end
    it "記事を作成する" do
      visit "/articles/new"
      fill_in "article[title]", with: "test"
      fill_in "article[content]", with: "test"
      click_on "記事を作成する"
      expect(current_path).to eq "/articles/#{Article.last.id}"
    end
  end
  
  context "権限のないページへのアクセス" do
    it "管理者ログイン前に会員一覧に遷移できない" do
      visit "/admin/users"
      expect(current_path).to eq "/admin/sign_in"
    end
  end
  
  context "ログアウト操作" do
    it "ログアウトする" do
      click_on "ログアウト"
      expect(current_path).to eq "/"
      expect(page).to have_content "ログアウトしました"
    end
  end
end

describe "[2]管理者ログイン後のテスト"  do
  before do
    FactoryBot.create(:admin)
    FactoryBot.create(:user)
    FactoryBot.create(:article)
    FactoryBot.create(:article_image)
    visit "/"
    click_on "管理者ログイン"
    click_on "管理者ゲストログイン"
  end
  
  context "トップ画面" do
    it "URLが正しい" do
      expect(current_path).to eq "/"
    end
    it "ロゴがトップページへのリンクである" do
      find(".logo").click
      expect(current_path).to eq "/"
    end
    it "管理者ログイン表示がある" do
      expect(page).to have_content "管理者としてログインしています"
    end
  end
  
  context "会員リスト" do 
    it "URLが正しい" do
      click_on "会員リスト"
      expect(current_path).to eq "/admin/users"
    end
    it "会員情報が表示されている" do
      visit "/admin/users"
      expect(page).to have_content "testuser1"
    end
    it "会員情報編集ボタンがある" do
      visit "/admin/users"
      expect(page).to have_content "編集する"
      click_on "編集する"
      expect(current_path).to eq "/admin/users/1/edit"
    end
    it "会員削除ボタンがある" do
      visit "/admin/users/1"
      expect(page).to have_content "削除する"
    end
  end
  
  context "会員詳細画面" do 
    before do
      FactoryBot.create(:article)
      FactoryBot.create(:article_image)
    end
    it "URLが正しい" do
      visit "/admin/users/1"
      expect(current_path).to eq "/admin/users/1"
    end
    it "会員情報が表示されている" do
      visit "/admin/users/1"
      expect(page).to have_content "testuser1"
    end
    it "会員情報編集ボタンがある" do
      visit "/admin/users/1"
      expect(page).to have_content "会員情報を編集する"
      click_on "会員情報を編集する"
      expect(current_path).to eq "/admin/users/1/edit"
    end
    it "投稿記事一覧がある" do
      visit "/admin/users/1"
      expect(page).to have_content "投稿記事の管理"
      expect(page).to have_content "編集する"
      expect(page).to have_content "削除する"
    end
  end
  
  context "記事リスト画面" do
    before do
      FactoryBot.create(:article_image)
    end
    it "URLが正しい" do
      click_on "記事リスト"
      expect(current_path).to eq "/admin/articles"
    end
    it "編集ボタンがある" do
      visit "/admin/articles"
      expect(page).to have_content "編集する"
      click_on "編集する"
      expect(current_path).to eq "/admin/articles/1/edit"
    end
    it "削除ボタンがある" do
      visit "/admin/articles"
      expect(page).to have_content "削除する"
      click_on "削除する"
      expect(current_path).to eq "/admin/articles"
    end
  end
  
  context "検索結果画面" do
    it "検索する→検索結果画面" do
      find("#navbarsearch").click
      click_on "Search"
      expect(current_path).to eq "/admin/search"
    end
  end
  
  context "権限のないページへのアクセス" do
    it "会員URLのマイページに遷移できない" do
      visit "/users/1"
      expect(current_path).to eq "/users/sign_in"
    end
  end
  
  context "ログアウト操作" do
    it "ログアウトする" do
      click_on "ログアウト"
      expect(current_path).to eq "/"
      expect(page).to have_content "ログアウトしました"
    end
  end
end