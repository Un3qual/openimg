# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Guest', password: 'opensesame')
User.create(username: 'System', password: 'opensesame', is_admin: true, is_moderator: true)
User.create(username: 'dude', password: 'opensesame')