require 'sinatra'
require 'sinatra/base'
require 'sinatra/activerecord'

if ENV['ENVIRONMENT'] == 'test'
	set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'makersbnb_dev', pool: 2}	
else
	set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'makersbnb', pool: 2}
end

  get '/' do
    @spaces = Space.all? #LOOK AT METHOD NAME
    erb(:index)
  end

  get '/spaces/:id' do
    @space = Space.find(id: params[:id]) #DOUBLE CHECK METHOD
    erb :'spaces/view'
  end

class MakersBNB < Sinatra::Base

run! if app_file == $0
end
