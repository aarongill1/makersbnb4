require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'
enable :sessions

require './models/property'

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
    @property = Property.find(params[:id])
    erb(:'property/view')
  end

run! if app_file == $0
end
