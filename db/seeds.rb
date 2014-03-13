# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create([
	{ email: 'annieccheung@gmail.com', password: 'annie',  },
  { email: 'annacalla15@gmail.com', password: '', password_confirmation: '' },
  { email: 'bridgetngrant@gmail.com' password: '', password_confirmation: '' }

	])
