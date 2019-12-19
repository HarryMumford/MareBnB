require 'sinatra/base'
require 'sinatra/activerecord'
require_relative 'lib/listing'
require_relative 'lib/user'
require_relative 'lib/availability'
require_relative 'lib/request'
require_relative 'lib/helpers/request_status.rb'

class MareBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
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
    listing = Listing.create(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      user_id: session[:user_id]
    )
    Availability.create(
      start: params[:start_date],
      end: params[:end_date],
      listing_id: listing.id
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
    @availability = Availability.select_by_listing(@listing.id)
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

  post '/requests/new' do
    Request.create(
      user_id: session[:user_id],
      listing_id: params[:listing_id],
      start: params[:start_date],
      end: params[:end_date],
      accepted: false,
      rejected: false
    )
    redirect '/listings'
  end

  get '/requests/:id' do
    @made_requests = Request.joins(:listing).select { |r| r.user_id == session[:user_id] }
    @received_requests = Request.joins(:listing)
      .select { |r| r.listing.user_id == session[:user_id] }
    erb :requests
  end

  post '/requests/accept' do
    request = Request.find_by(id: params[:id])
    Availability.confirm_request(request)
    200
  end

  post '/requests/reject' do
    Request.update(params[:id], rejected: true)
    200
  end

  run! if app_file == $0
end
