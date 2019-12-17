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
    Listing.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      user_id: session[:user_id]
    )
    redirect '/listings'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/listings/:id' do
    @listing = Listing.find_by(id: params[:id])
    @user = User.find_by(id: @listing.user_id)
    erb :'listings/show'
  end
  
  get '/login' do
    @message = session[:message]
    erb :login
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])  
      session[:user_id] = user.id
      redirect '/listings'
    else
      session[:message] = "Incorrect details"
      redirect '/login'
    end
  end

  get '/logout' do
    session.delete(:user_id)
    redirect '/listings'
  end

  run! if app_file == $0
end
