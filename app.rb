require 'sinatra/base'
require 'sinatra/activerecord'
require_relative 'lib/listing'
require_relative 'lib/user'

class MareBnB < Sinatra::Base
  enable :sessions

  get '/' do
    "MareBnB"
  end

  get '/listings' do
    @listings = Listing.all
    @user = User.find_by(id: session[:user_id])
    erb :listings
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings' do
    Listing.create(name: params[:name], description: params[:description], user_id: 1)
    redirect '/listings'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email])
    session[:user_id] = user.id
    redirect '/listings'
  end

  run! if app_file == $0
end
