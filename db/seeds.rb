# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all
cat1 = Cat.create!(birth_date: "2000/01/05", color: "black", name: "Kevin", sex: "M")
cat2 = Cat.create!(birth_date: "2005/04/05", color: "brown", name: "Rod", sex: "M")
cat3 = Cat.create!(birth_date: "2009/01/05", color: "orange", name: "Catom", sex: "F")


User.destroy_all
user1 = User.create!(user_name: "greg_hunter24", password_digest: BCrypt::Password.create("hunter12"))
user2 = User.create!(user_name: "adam_fireball24", password_digest: BCrypt::Password.create("fireball42"))
