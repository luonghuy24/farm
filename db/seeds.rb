# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "** seed 20 users **"
	20.times { Fabricate(:user) }
puts "** create admin **"
	u = User.create(username: "admin", email: "admin@admin.com", password: "12345678", role: "admin")
puts "** seed 20 products **"
	20.times { Fabricate(:product) }

puts "** create 10 articles **"
	10.times { Fabricate(:article) }