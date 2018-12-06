require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'

class MakersBNB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    @check_in = session[:check_in]
    @properties = Property.all
    flash[:no_property_message] = "No properties are available on your date"
    erb(:index)
  end

  get '/property/new' do
    erb :'property/new'
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
		redirect 'user/details'
	end

	get '/user/details' do
    @bookings = Booking.all
		@user = User.get(session[:id])
		erb :'user/details'
	end

	post '/user/login' do
		@user = User.first(:username => params[:username])
		if @user.password == params[:password]
			session[:id] = @user.id
			redirect 'user/details'
		else
			flash[:incorrect_password_message] = "Incorrect password"
      redirect 'user/new'
		end
	end

  post '/property/create' do
		@property = Property.create(
      user_id: session[:id],
			title: params[:title],
  		description: params[:description],
  		price: params[:price],
  		guests: params[:guests],
  		city: params[:city],
  		bedrooms: params[:bedrooms],
      beds: params[:beds],
      bathrooms: params[:bathrooms],
      photo_url: params[:photo_url],
      available_from: params[:date_from],
      available_to: params[:date_to]
		)
		redirect "/property/#{@property.id}"
	end


run! if app_file == $0
end
