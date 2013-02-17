# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# Create admin user
Admin.create(email: 'ileeftimov@gmail.com', password: 'eftimov', password_confirmation: 'eftimov')
p "Admin user created -> Email: ileeftimov@gmail.com, Password: eftimov"

# Add genres
genres = [
  { name_eng: "Action", name_cyr: "Акција"},
  { name_eng: "Adventure", name_cyr: "Авантура" },
  { name_eng: "Animation", name_cyr: "Анимиран" },
  { name_eng: "Biography", name_cyr: "Биографски" },
  { name_eng: "Comedy", name_cyr: "Комедија" },
  { name_eng: "Crime", name_cyr: "Крими" },
  { name_eng: "Documentary", name_cyr: "Документарен" },
  { name_eng: "Drama", name_cyr: "Драма" },
  { name_eng: "Fantasy", name_cyr: "Фантазија" },
  { name_eng: "History", name_cyr: "Историски" },
  { name_eng: "Horror", name_cyr: "Хорор" },
  { name_eng: "Musical", name_cyr: "Мјузикл" },
  { name_eng: "Mystery", name_cyr: "Мистерија" },
  { name_eng: "Romance", name_cyr: "Романса" },
  { name_eng: "Sci-Fi", name_cyr: "Научна фантастика" },
  { name_eng: "Sport", name_cyr: "Спортски" },
  { name_eng: "Thriller", name_cyr: "Трилер" },
  { name_eng: "War", name_cyr: "Воен" },
  { name_eng: "Western", name_cyr: "Вестерн" }
]

genres.each do |g|
  Genre.create(name_cyr: g[:name_cyr], name_eng: g[:name_eng])
end
p "Added genres!"
