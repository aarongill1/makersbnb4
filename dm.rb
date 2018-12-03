require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'
require 'database_cleaner'
require 'bcrypt'

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
	property :first_name, 		String
	property :last_name,			String
	property :password, 			String

	has n, :property
end

class Property
	include DataMapper::Resource
	Property.raise_on_save_failure = true

	property :id,								Serial
	property :title, 						String
	property :description,			String
	property :price,						Integer
	property :host_name,				String
	property :host_number,			String
	property :guests,						Integer
	property :bedrooms,					Integer
	property :beds,							Integer
	property :bathrooms, 				Integer

	belongs_to :user
end

DataMapper.finalize
DataMapper.auto_upgrade!