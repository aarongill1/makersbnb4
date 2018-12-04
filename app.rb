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
    @check_in = session[:check_in]
    @properties = Property.all
    p @check_in
    erb(:index)
  end

  get '/property/:id' do
    @property = Property.get(params[:id])
    erb(:'property/view')
  end

  post '/dates' do
    session[:check_in] = params[:'trip-start']
    redirect '/'
  end

run! if app_file == $0
end
