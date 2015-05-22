# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	

1.upto(2){ 

	email = Faker::Internet.email
	password = Faker::Internet.password(10, 20)

	name = Faker::Name.name
	biography = Faker::Lorem.paragraph
	contact_person = Faker::Name.title
	phone_number = Faker::Number.number(9)
	address = Faker::Address.street_address
	web =  Faker::Internet.url('my_web.es')
	avatar = Faker::Avatar.image
	twitter = Faker::Name.first_name
	facebook = Faker::Name.first_name
	instagram = Faker::Name.first_name
	pinterest = Faker::Name.first_name
	google_plus = Faker::Name.first_name

	title = Faker::Hacker.noun
	price = Faker::Number.number(3)
	work_avatar = Faker::Avatar.image

	user = User.create :email => email, :password => 'abcd1234' , :name => name, :biography => biography,
					   :contact_person => contact_person, :phone_number => phone_number, 
					   :address => address, :web => web, :avatar => avatar, 
				       :rrss => [twitter, facebook, instagram, pinterest, google_plus], 
				       :role => 'Artist'

	artist = user.create_artist(:you_are => 'Fotografía', :type_of_professional => 'Consagrados',
								:type_of_locals => 'Galería', :type_of_expositions => 'Un único artista',
								:agreements_with_locals => 'Alquiler del local')

	work = artist.works.create :title => title, :size => "60x60", :price => price, :avatar => work_avatar

}


1.upto(2){ 

	email = Faker::Internet.email
	password = Faker::Internet.password(10, 20)

	name = Faker::Name.name
	biography = Faker::Lorem.paragraph
	contact_person = Faker::Name.title
	phone_number = Faker::Number.number(9)
	address = Faker::Address.street_address
	web =  Faker::Internet.url('my_web.es')
	avatar = Faker::Avatar.image
	twitter = Faker::Name.first_name
	facebook = Faker::Name.first_name
	instagram = Faker::Name.first_name
	pinterest = Faker::Name.first_name
	google_plus = Faker::Name.first_name

	title = Faker::Hacker.noun
	price = Faker::Number.number(3)
	work_avatar = Faker::Avatar.image

	user = User.create :email => email, :password => 'abcd1234' , :name => name, :biography => biography,
					   :contact_person => contact_person, :phone_number => phone_number, 
					   :address => address, :web => web, :avatar => avatar, 
				       :rrss => [twitter, facebook, instagram, pinterest, google_plus], 
				       :role => 'Artist'

	artist = user.create_artist(:you_are => 'Pintura', :type_of_professional => 'Noveles',
								:type_of_locals => 'Museo', :type_of_expositions => 'Varios artistas',
								:agreements_with_locals => 'Comisión de venta')

	work = artist.works.create :title => title, :size => "50x50", :price => price, :avatar => work_avatar

}

1.upto(2){ 

	email = Faker::Internet.email
	password = Faker::Internet.password(10, 20)

	name = Faker::Name.name
	biography = Faker::Lorem.paragraph
	contact_person = Faker::Name.title
	phone_number = Faker::Number.number(9)
	address = Faker::Address.street_address
	web =  Faker::Internet.url('my_web.es')
	avatar = Faker::Avatar.image
	twitter = Faker::Name.first_name
	facebook = Faker::Name.first_name
	instagram = Faker::Name.first_name
	pinterest = Faker::Name.first_name
	google_plus = Faker::Name.first_name

	title = Faker::Hacker.noun
	price = Faker::Number.number(3)
	work_avatar = Faker::Avatar.image

	user = User.create :email => email, :password => 'abcd1234' , :name => name, :biography => biography,
					   :contact_person => contact_person, :phone_number => phone_number, 
					   :address => address, :web => web, :avatar => avatar, 
				       :rrss => [twitter, facebook, instagram, pinterest, google_plus], 
				       :role => 'Artist'

	artist = user.create_artist(:you_are => 'Escultura', :type_of_professional => 'Amateur',
								:type_of_locals => 'Café Temático', :type_of_expositions => 'Varios artistas',
								:agreements_with_locals => 'Alquiler del local')

	work = artist.works.create :title => title, :size => "150x100", :price => price, :avatar => work_avatar

}


########    LOCALES      ########

1.upto(2){ 

	email = Faker::Internet.email
	password = Faker::Internet.password(10, 20)

	name = Faker::Name.name
	biography = Faker::Lorem.paragraph
	contact_person = Faker::Name.title
	phone_number = Faker::Number.number(9)
	address = Faker::Address.street_address
	web =  Faker::Internet.url('webart.es')
	avatar = Faker::Avatar.image
	twitter = Faker::Name.first_name
	facebook = Faker::Name.first_name
	instagram = Faker::Name.first_name
	pinterest = Faker::Name.first_name
	google_plus = Faker::Name.first_name


	user = User.create :email => email, :password => 'abcd1234' , :name => name, :biography => biography,
					   :contact_person => contact_person, :phone_number => phone_number, 
					   :address => address, :web => web, :avatar => avatar, 
				       :rrss => [twitter, facebook, instagram, pinterest, google_plus], 
				       :role => 'Local'
				       
	local = user.create_local(:you_are => 'Galería', :shows => 'Fotografía',:type_of_professional => 'Amateur', 
		:type_of_exposition => 'Un único artista', :agreements => 'Alquiler del local')
}


1.upto(2){ 

	email = Faker::Internet.email
	password = Faker::Internet.password(10, 20)

	name = Faker::Name.name
	biography = Faker::Lorem.paragraph
	contact_person = Faker::Name.title
	phone_number = Faker::Number.number(9)
	address = Faker::Address.street_address
	web =  Faker::Internet.url('artweb.es')
	avatar = Faker::Avatar.image
	twitter = Faker::Name.first_name
	facebook = Faker::Name.first_name
	instagram = Faker::Name.first_name
	pinterest = Faker::Name.first_name
	google_plus = Faker::Name.first_name


	user = User.create :email => email, :password => 'abcd1234' , :name => name, :biography => biography,
					   :contact_person => contact_person, :phone_number => phone_number, 
					   :address => address, :web => web, :avatar => avatar, 
				       :rrss => [twitter, facebook, instagram, pinterest, google_plus], 
				       :role => 'Local'
				       
	local = user.create_local(:you_are => 'Café Temático', :shows => 'Pintura',:type_of_professional => 'Noveles', 
		:type_of_exposition => 'Varios artistas', :agreements => 'Comisión de venta')
}


1.upto(2){ 

	email = Faker::Internet.email
	password = Faker::Internet.password(10, 20)

	name = Faker::Name.name
	biography = Faker::Lorem.paragraph
	contact_person = Faker::Name.title
	phone_number = Faker::Number.number(9)
	address = Faker::Address.street_address
	web =  Faker::Internet.url('gestionart.net')
	avatar = Faker::Avatar.image
	twitter = Faker::Name.first_name
	facebook = Faker::Name.first_name
	instagram = Faker::Name.first_name
	pinterest = Faker::Name.first_name
	google_plus = Faker::Name.first_name


	user = User.create :email => email, :password => 'abcd1234' , :name => name, :biography => biography,
					   :contact_person => contact_person, :phone_number => phone_number, 
					   :address => address, :web => web, :avatar => avatar, 
				       :rrss => [twitter, facebook, instagram, pinterest, google_plus], 
				       :role => 'Local'
				       
	local = user.create_local(:you_are => 'Centro Educativo', :shows => 'Artes Visuales',:type_of_professional => 'Consagrados', 
		:type_of_exposition => 'Varios artistas', :agreements => 'Alquiler del local')
}


