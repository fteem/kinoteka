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
