# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  User.create!(
    name:     "testuser#{n + 1}",
    email:    "testuser#{n + 1}@mail.com",
    password: "testpw"
  )
end

Admin.create!(
  email:      "admin@admin.com",
  password:   "administrator"
)

7.times do |n|
  Article.create!(
    user_id:  1,
    title:    "#{n + 1}件目の投稿記事のタイトル",
    content:
      "Lorem ipsum dolor sit amet,\r\n
      consectetur adipiscing elit, \r\n
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \r\n
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \r\n
      Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \r\n
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    likes_count: 0
  )
end

Article.create!(
  user_id:  1,
  title:    "8件目の投稿記事のタイトル",
  content:
    "Lorem ipsum dolor sit amet,\r\n
    consectetur adipiscing elit, \r\n
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \r\n
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \r\n
    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \r\n
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n
    ◇画像借用元\r\n
    'Technology photo created by rawpixel.com - www.freepik.com' (https://www.freepik.com/photos/technology)\r\n
    'Gerd AltmannによるPixabayからの画像'",
  likes_count: 0
)

Article.create!(
  user_id:  1,
  title:    "9件目の投稿記事のタイトル",
  content:
    "Lorem ipsum dolor sit amet,\r\n
    consectetur adipiscing elit, \r\n
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \r\n
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \r\n
    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \r\n
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n
    ◇画像借用元\r\n
    '使いやすいiPadminiのフリー素材' (https://www.pakutaso.com/20190550142ipadmini-6.html)\r\n
    'Applepencilで画面に書き込む男性のフリー素材' (https://www.pakutaso.com/20190530122applepencil-2.html)\r\n
    'Applepencilの書き心地を確かめる男性のフリー素材' (https://www.pakutaso.com/20190547122applepencil-1.html)",
  likes_count: 0
)

Article.create!(
  user_id:  1,
  title:    "10件目の投稿記事のタイトル",
  content:
    "Lorem ipsum dolor sit amet,\r\n
    consectetur adipiscing elit, \r\n
    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \r\n
    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \r\n
    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \r\n
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n
    ◇画像借用元\r\n
    '（AppleWatch）のフリー素材' (https://www.pakutaso.com/20190850239applewatch-4.html)\r\n
    'Apple Watch Series 4 と Apple Watch Series 3のフリー素材' (https://www.pakutaso.com/20180957270apple-watch-series-4-apple-watch-series-3.html)\r\n
    'スマートウォッチのつまみ部分のフリー素材' (https://www.pakutaso.com/20170517129post-11384.html)",
  likes_count: 0
)

10.times do |n|
  Like.create!(
    user_id:      1,
    article_id:   1
  )
  Like.create!(
    user_id:      2,
    article_id:   1
  )
end

2.times do |n|
  Comment.create!(
    user_id:      n+2,
    article_id:   n+1,
    body: "私も同感です。Lorem ipsum dolor sit amet"
  )
end

# ArticleImage create #1
image = ArticleImage.new
image.article_id = 10
image.image = File.open("./app/assets/images/macbook1990_TP_V4.jpg")
image.save

# ArticleImage create #2
image = ArticleImage.new
image.article_id = 10
image.image = File.open("./app/assets/images/APgoriFTHG5756_TP_V4.jpg")
image.save

# ArticleImage create #3
image = ArticleImage.new
image.article_id = 10
image.image = File.open("./app/assets/images/IPPAKU9107_TP_V4.jpg")
image.save

# ArticleImage create #4
image = ArticleImage.new
image.article_id = 9
image.image = File.open("./app/assets/images/ipad424249_TP_V4.jpg")
image.save

# ArticleImage create #5
image = ArticleImage.new
image.article_id = 9
image.image = File.open("./app/assets/images/ipad424248_TP_V4.jpg")
image.save

# ArticleImage create #6
image = ArticleImage.new
image.article_id = 9
image.image = File.open("./app/assets/images/ipad424240_TP_V4.jpg")
image.save

# ArticleImage create #7
image = ArticleImage.new
image.article_id = 8
image.image = File.open("./app/assets/images/hands-digital-universe-background.jpg")
image.save

# ArticleImage create #8
image = ArticleImage.new
image.article_id = 8
image.image = File.open("./app/assets/images/smart-home_640.jpg")
image.save
