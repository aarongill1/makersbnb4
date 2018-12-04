require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'

<<<<<<< HEAD
if ENV['ENVIRONMENT'] == 'test'
	set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'makersbnb_test', pool: 2}	
else
	set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'makersbnb', pool: 2}
end

class MakersBNB < Sinatra::Base

	get '/' do
    @spaces = Space.all? #LOOK AT METHOD NAME
=======


class MakersBNB < Sinatra::Base
	enable :sessions
	register Sinatra::Flash

	get '/' do
    @properties = Property.all #LOOK AT METHOD NAME
>>>>>>> 1eca0c48e5541b8abedac102e62d0ea35846b9c0
    erb(:index)
  end

  get '/spaces/:id' do
  	idx = params[:id]
    @space = Property.find(1) #DOUBLE CHECK METHOD
    erb :'spaces/view'
  end

run! if app_file == $0
end
