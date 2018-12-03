require 'sinatra/base'
class MakersBNB < Sinatra::Base

  get '/' do
    @spaces = space.all? #LOOK AT METHOD NAME 
    erb(:index)
  end

run! if app_file == $0
end
