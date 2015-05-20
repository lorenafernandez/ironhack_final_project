# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do 
	email = Faker::Internet.email
	password = Faker::Internet.password(10, 20)

	name = Faker::Name.name
	biography = Faker::Lorem.paragraph
	contact_person = Faker::Name.title
	phone_number = Faker::PhoneNumber.number(9)
	address = Faker::Address.street_address
	province = Faker::Address.country
	town = Faker::Address.city
	postal_code = Faker::PhoneNumber.number(5)
	web =  Faker::Internet.url('my_web.es')
	avatar = Faker::Avatar.image
	twitter = Faker::Name.first_name
	facebook = Faker::Name.first_name
	instagram = Faker::Name.first_name
	pinterest = Faker::Name.first_name
	google_plus = Faker::Name.first_name
end

users = []

1.upto(25){ 
	users.push(User.create :email => email, :password => password, :name => name, :biography => biography,
				:contact_person => contact_person, :phone_number => phone_number,)
}