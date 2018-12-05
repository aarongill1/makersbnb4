require './dm'
require 'pg'

DataMapper.setup(:default, "postgres://localhost/makersbnb")

user_1 = User.create(
	username: "testingAccount1",
	email: "testacc1@hotmail.com",
	phone_number: "07738623766",
	first_name: "Test",
	last_name: "Account",
	password: "password123"
)

user_2 = User.create(
	username: "testAccount2",
	email: "testingacc2@hotmail.com",
	phone_number: "07738623766",
	first_name: "Test",
	last_name: "Account",
	password: "password123"
)

property_1 = Property.create(
	user_id: user_1.id,
	title: "A test House",
	description: "Spacious 2 bedroom house near the beach.",
	price: 130,
	city: "Margate",
	guests: 4,
	bedrooms: 2,
	beds: 2,
	bathrooms: 1,
	available_from: Date.parse("2018-12-04"),
	available_to: 	Date.parse("2019-02-04"),
	photo_url:"https://tinyurl.com/ydfuwacb"
)

property_2 = Property.create(
	user_id: user_2.id,
	title: "A test Flat",
	description: "Cramped 1 bedroom flat near city centre.",
	price: 130,
	city: "London",
	guests: 2,
	bedrooms: 1,
	beds: 1,
	bathrooms: 1,
	available_from: Date.parse("2018-12-04"),
	available_to: 	Date.parse("2019-02-04"),
	photo_url:"https://tinyurl.com/yc5pekql"
)
