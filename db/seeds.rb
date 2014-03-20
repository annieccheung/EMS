# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

temp_password = "123"

User.create([
  { email: 'annieccheung@gmail.com', password: temp_password, password_confirmation: temp_password, status: 'vet', first_name: 'Annie', last_name: 'Cheung'},
  { email: 'annacalla15@gmail.com', password: temp_password, password_confirmation: temp_password, status: 'rookie', first_name: 'Anna', last_name: 'Callaghan'},
  { email: 'bridgetngrant@gmail.com', password: temp_password, password_confirmation: temp_password, status: 'rookie', first_name: 'Bridget', last_name: 'Grant'},
  { email: 'mbing@scu.edu', password: temp_password, password_confirmation: temp_password, status: 'vet', first_name: 'Molly', last_name: 'Bing'},

	])
