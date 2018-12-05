require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'

class MakersBNB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    @check_in = session[:check_in]
    p @check_in
    @properties = Property.all
    flash[:message] = "No properties are available on your date"
    erb(:index)
  end

  get '/property/:id' do
    @property = Property.get(params[:id])
    @user = User.get(@property.user_id)
    erb(:'property/view')
  end

  post '/dates' do
    session[:check_in] = params[:'trip-start']
    redirect '/'
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
