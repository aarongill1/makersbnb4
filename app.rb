require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './dm'



class MakersBNB < Sinatra::Base
	enable :sessions
	register Sinatra::Flash

	get '/' do
    @properties = Property.all #LOOK AT METHOD NAME
    erb(:index)
  end

  get '/spaces/:id' do
  	idx = params[:id]
    @space = Property.find(1) #DOUBLE CHECK METHOD
    erb :'spaces/view'
  end

run! if app_file == $0
end
