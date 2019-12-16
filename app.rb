require 'sinatra/base'
require 'sinatra/activerecord'
require_relative 'lib/listing'

class MareBnB < Sinatra::Base

  get '/' do
    "MareBnB"
  end

  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    Listing.create(name: params[:name], description: params[:description], user_id: 1)
    redirect '/listings'
  end

  run! if app_file == $0
end
