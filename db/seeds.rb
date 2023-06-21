# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: "mail@1", password: "123456")
Customer.create(last_name: "山田", last_name_kana: "ヤマダ", first_name: "太郎", first_name_kana: "タロウ", postal_code: "1234567", email: "mail@2", address: "都道府県　市町村　丁番地", phone_number: "09012345678" ,password: "123456")
ItemGenre.create([
  {name: 'ケーキ'},
  {name: 'プリン'},
  {name: '焼き菓子'},
  {name: 'キャンディ'}
])
