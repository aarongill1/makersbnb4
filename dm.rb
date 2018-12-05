require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'
require 'database_cleaner'
require 'bcrypt'
require 'pg'

if ENV['ENVIRONMENT'] == 'test'
	DataMapper.setup(:default, "postgres://localhost/makersbnb_test")
else
	DataMapper.setup(:default, "postgres://localhost/makersbnb")
end

class User
	include DataMapper::Resource
	User.raise_on_save_failure = true

	property :id, 						Serial
	property :username, 			String
	property :email, 					String
	property :phone_number,		String
	property :first_name, 		String
	property :last_name,			String
	property :password, 			String, :length => 140

	has n, :property
	has n, :booking
end

class Property
	include DataMapper::Resource
	Property.raise_on_save_failure = true

	property :id,								Serial
	property :title, 						String
	property :description,			String, :length => 250
	property :price,						Integer
	property :city,							String
	property :guests,						Integer
	property :bedrooms,					Integer
	property :beds,							Integer
	property :bathrooms, 				Integer
	property :available_from,		Date
	property :available_to,			Date
	property :photo_url,				String, :length => 250

	belongs_to :user
	has n, :booking
end

class Booking
	include DataMapper::Resource
	Booking.raise_on_save_failure = true

	property :id,								Serial
	property :start_date,				Date
	property :end_date,					Date
	property :status,						String, :length => 20

	belongs_to :user, :property
end

DataMapper.finalize
DataMapper.auto_upgrade!
