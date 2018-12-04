require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'

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
		@user = User.create(
			username: params[:username],
  		email: params[:email],
  		first_name: params[:first_name],
  		last_name: params[:last_name],
  		password: params[:password],
  		phone_number: params[:phone_number]
		)
		session[:id] = @user.id
		redirect :'user/details'
	end

	get '/user/details' do
		@user = User.get(session[:id])
		erb :'user/details'
	end

	post '/user/login' do
		@user = User.first(:username => params[:username])
		if @user.password == params[:password]
			session[:id] = @user.id
			redirect :'user/details'
		else
			flash[:message] = "Incorrect password"
		end
	end

run! if app_file == $0
end
