require 'sinatra/base'

class MareBnB < Sinatra::Base

  get '/' do
    "MareBnB"
  end

  run! if app_file == $0

end
