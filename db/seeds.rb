# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# random user generator powered by https://randomuser.me/api/
10.times do |n|
  uri = URI.parse("https://randomuser.me/api/")
  json = Net::HTTP.get(uri)
  person = JSON.parse(json)
  
  User.create!(
    name:     person['results'][0]['login']['username'],
    email:    person['results'][0]['email'],
    password: "testpw"
  )
end

User.create!(
  name:       "ゲストユーザー",
  email:      "guest@mail.com",
  password:   "guestpw"
  )

Admin.create!(
  email:      "admin@admin.com",
  password:   "administrator"
)

# 7.times do |n|
#   Article.create!(
#     user_id:  n + 1,
#     title:    "#{n + 1}件目の投稿記事のタイトル",
#     content:
#       "Lorem ipsum dolor sit amet,\r\n
#       consectetur adipiscing elit, \r\n
#       sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \r\n
#       Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \r\n
#       Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \r\n
#       Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#     likes_count: 0
#   )
# end

Article.create!(
  user_id:  3,
  title:    "気になる言葉「IoT」？",
  content:
    "下記は引用です。「ITトレンドのIT用語集　IoTとは - 意味の解説（https://it-trend.jp/words/iot）」\r\n
    >IoTとは、Internet of Things の略である。日本語では、「モノのインターネット」と訳される事が多い。\r\n
    \r\n
    >これまでインターネットに接続されていなかった多くの物理的な「モノ」に、センサーや電子デバイスを埋め込んでインターネットに接続することで、それらの「モノ」がデータや情報をやりとりすることが可能になる。\r\n
    >このような仕組みをIoTという。\r\n
    \r\n
    ◇画像借用元\r\n
    'Technology photo created by rawpixel.com - www.freepik.com' (https://www.freepik.com/photos/technology)\r\n
    'Gerd AltmannによるPixabayからの画像'(https://pixabay.com/ja/)",
  likes_count: 0
)

Article.create!(
  user_id:  2,
  title:    "iPadminiを仕事の相棒にしたい！ほしい！",
  content:
    "「とてもすごい。。。」\r\n
    \r\n
    片手でもしっかり持ってApplePencilで書きこむことができます。\r\n
    \r\n
    サイズ感は写真を見てください！\r\n
    \r\n
    ◇画像借用元\r\n
    '使いやすいiPadminiのフリー素材' (https://www.pakutaso.com/20190550142ipadmini-6.html)\r\n
    'Applepencilで画面に書き込む男性のフリー素材' (https://www.pakutaso.com/20190530122applepencil-2.html)\r\n
    'Applepencilの書き心地を確かめる男性のフリー素材' (https://www.pakutaso.com/20190547122applepencil-1.html)",
  likes_count: 0
)

Article.create!(
  user_id:  1,
  title:    "Apple Watchで生活が捗るハック5選",
  content:
    "スマートウォッチはいろいろな種類が出ていますが、Apple Watchはデザインと機能の両方が魅力です！\r\n
    \r\n
    家の中で身に着けていても大変便利なガジェットです。\r\n
    \r\n
    今回はApple Watchを買うと捗る5つのライフハックを紹介します。
    \r\n
    【ハック1.】 iPhoneがなくてもSuicaやApplePay(アップルペイ)など電子マネーで買い物ができる\r\n
    \r\n
    【ハック2.】 iPhoneを都度操作しなくてもメールやLINE(ライン)などの通知を見ることができる\r\n
    \r\n
    【ハック3.】 GPSを活用して健康やスポーツに必要なランニングやウォーキングのログ(記録)をつけることができる\r\n
    \r\n
    【ハック4.】 一日のライフログ(行動記録)を自動で取ることができる\r\n
    \r\n
    【ハック5.】 iPhoneがなくてもApple WatchとAirPods(エアポッズ)だけで音楽を持ち歩くことができる\r\n
    \r\n
    まだまだ魅力を伝えたいですが、デザイン面も非常に推しポイントです！写真をみてください！\r\n
    \r\n
    以上です！\r\n
    \r\n
    ◇画像借用元\r\n
    '（AppleWatch）のフリー素材' (https://www.pakutaso.com/20190850239applewatch-4.html)\r\n
    'Apple Watch Series 4 と Apple Watch Series 3のフリー素材' (https://www.pakutaso.com/20180957270apple-watch-series-4-apple-watch-series-3.html)\r\n
    'スマートウォッチのつまみ部分のフリー素材' (https://www.pakutaso.com/20170517129post-11384.html)",
  likes_count: 0
)

5.times do |n|
  Like.create!(
    user_id:      n + 2,
    article_id:   3
  )
end

3.times do |n|
  Like.create!(
    user_id:      n + 3,
    article_id:   2
  )
end

2.times do |n|
  Comment.create!(
    user_id:      n + 2,
    article_id:   n + 1,
    body: "いいですね"
  )
end

# ArticleImage insert
imageArray = [
  # ArticleImage create #1-2 for article_id: 1
  ["./app/assets/images/hands-digital-universe-background.jpg",
    "./app/assets/images/smart-home_640.jpg"
  ],
  # ArticleImage create #3-5 for article_id: 2
  ["./app/assets/images/ipad424249_TP_V4.jpg",
    "./app/assets/images/ipad424248_TP_V4.jpg",
    "./app/assets/images/ipad424240_TP_V4.jpg"
  ],
  # ArticleImage create #6-8 for article_id: 3
  ["./app/assets/images/macbook1990_TP_V4.jpg",
    "./app/assets/images/APgoriFTHG5756_TP_V4.jpg",
    "./app/assets/images/IPPAKU9107_TP_V4.jpg"
  ]
]

imageArray.each.with_index(1) do |array, n|
  array.each do |img|
    image = ArticleImage.new
    image.article_id = n
    image.image = File.open(img)
    image.save
  end
end