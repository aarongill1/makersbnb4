require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'

class MakersBNB < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    @properties = Property.all(
      :available_from.lte => session[:check_in],
      :available_to.gte => session[:check_in]
    )
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
		@user = User.get(session[:id])

    @bookings_for_approval = repository(:default).adapter.select(
      "SELECT bookings.id, bookings.status, bookings.start_date, bookings.end_date, bookings.user_id,  properties.title, properties.description
      FROM properties
      INNER JOIN users
      ON properties.user_id = users.id
      INNER JOIN bookings
      ON bookings.property_id = properties.id
      WHERE users.id = #{@user.id};")

      @bookings = repository(:default).adapter.select(
      "SELECT start_date, status, title
      FROM bookings
      JOIN properties ON bookings.property_id = properties.id
      WHERE bookings.user_id = #{@user.id};"
    )
    
    @listings = Property.all(:user_id => @user.id)

		erb :'user/details'
	end

	post '/user/login' do
		@user = User.first(:username => params[:username])
		if @user.password == params[:password]
			session[:id] = @user.id
			redirect '/user/details'
		else
			flash[:incorrect_password_message] = "Incorrect password"
      redirect '/user/new'
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

  post '/booking/update' do
    @booking_to_update = Booking.first(params[:id])
    if params[:host_response]=="Approve"
       new_status = "#{params[:host_response].downcase}d"
     else
       new_status = "#{params[:host_response].downcase}ed"
     end
    @booking_to_update.update(:status => "#{new_status}")
    redirect ('/user/details')

  post '/booking/request' do
    @booking_check = Booking.first(
      :property_id => params[:id],
      :start_date => params[:date_requested],
      :status => 'approved')
    @property_check = Property.first(
      :id => params[:id],
      :available_from.lte => params[:date_requested],
      :available_to.gte => params[:date_requested]
    )
    p @property_check
    if @booking_check == nil && @property_check != nil
      @booking = Booking.create(
        start_date: params[:date_requested],
        property_id: params[:id],
        user_id: session[:id],
        status: 'requested'
      )
    redirect '/booking/request_submitted'
    else
      flash[:booking_unavailable] = "This property is not available on #{params[:date_requested]}"
      redirect "/property/#{params[:id]}"
    end
  end

  get '/booking/request_submitted' do
    erb :'booking/request_submitted'

  end

run! if app_file == $0
end
