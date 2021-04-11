# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |n|
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

50.times do |n|
  Article.create!(
    user_id:  n+1,
    title:    "#{n + 1}件目の投稿記事のタイトル",
    content:
      "Lorem ipsum dolor sit amet,\r\n
      consectetur adipiscing elit, \r\n
      sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \r\n
      Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \r\n
      Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \r\n
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )
end

2.times do |n|
  Like.create!(
    user_id:      n+2,
    article_id:   n+1
  )
end

2.times do |n|
  Comment.create!(
    user_id:      n+2,
    article_id:   n+1,
    body: "私も同感です。Lorem ipsum dolor sit amet"
  )
end