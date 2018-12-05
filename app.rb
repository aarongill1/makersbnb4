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
    p @check_in
    erb(:index)
  end

  # get '/property/:id' do
  #   @property = Property.get(params[:id])
  #   erb(:'property/view')
  # end

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
		@user = User.get(session[:id])
    p session[:id]
		erb :'user/details'
	end

	post '/user/login' do
		@user = User.first(:username => params[:username])
		if @user.password == params[:password]
			session[:id] = @user.id
			redirect 'user/details'
		else
			flash[:message] = "Incorrect password"
		end
	end

  get '/property/new' do
    p session[:id]
    erb :'property/new'
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
		# redirect "property/#{@property.id}"
    redirect "/"
	end


run! if app_file == $0
end
