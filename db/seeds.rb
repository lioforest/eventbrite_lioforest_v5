# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Attendance.destroy_all

20.times do 
	u = User.create!(
		email: "#{Faker::Internet.username}@yopmail.com",
		password: "000000",
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		description: Faker::Lorem.sentence(15)
		)
	puts u
end


20.times do 
	e = Event.create!(
		start_date: Faker::Date.forward(30),
		duration: Faker::Number.between(2, 5),
		description: Faker::Lorem.sentence(20),
		title: Faker::Lorem.sentence(8),
		price: Faker::Number.between(5, 20),
		location: Faker::Address.street_address,
		admin: User.all.sample
		)
	puts e
end

20.times do 
	Attendance.create!(
		stripe_customer_id: Faker::Lorem.characters(10),
		event: Event.all.sample,
		user: User.all.sample
		)
end