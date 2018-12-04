require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'

if ENV['ENVIRONMENT'] == 'test'
	set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'makersbnb_dev', pool: 2}
else
	set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'makersbnb', pool: 2}
end

class MakersBNB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    @properties = Property.all
    erb(:index)
  end

  get '/property/:id' do
    print params
    @property = Property.get(params[:id])
    erb(:'property/view')
  end

	get '/user/new' do
		erb :'user/new'
	end

	post '/user/create' do
		user = User.create(
			username: params[:username],
  		email: params[:email],
  		first_name: params[:first_name],
  		last_name: params[:last_name],
  		password: params[:password],
  		phone_number: params[:phone_number]
		)
		redirect :'user/details'
	end

	get '/user/details' do
	end

run! if app_file == $0
end
