# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者データ
Admin.create!(
  nickname: "管理者",
  email: "admin@admin.com",
  password: "adminpass"
)

# エンドユーザーデータ
EndUser.create!(
  nickname: "いっち",
  email: "sample@sample.com",
  password: "123456"
)

# 投稿記事タグデータ
ArticleTag.create([
  { name: 'レシピ' },
  { name: '保存方法' },
  { name: 'アレンジ料理' },
  { name: '雑学' }
])

# 保存場所データ
Storage.create([
  { name: '冷蔵庫' },
  { name: '冷凍庫' },
  { name: '常温品' },
  { name: '備蓄用' }
])