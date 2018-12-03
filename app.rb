require 'sinatra/base'
class MakersBNB < Sinatra::Base

  get '/' do
    @spaces = Space.all? #LOOK AT METHOD NAME
    erb(:index)
  end

  get '/spaces/:id' do
    @space = Space.find(id: params[:id]) #DOUBLE CHECK METHOD
    erb :'spaces/view'
  end

run! if app_file == $0
end
