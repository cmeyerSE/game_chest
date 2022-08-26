require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :index
  end

  get '/signup' do
    if !session[:user_id]
      erb :signup
    else
      redirect to '/games'
    end
  end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password])

    if user.save
      redirect "/login"
    else
      redirect "/failure"
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/games"
    else
      redirect "/failure"
    end
  end

  get '/failure' do
    erb :failure
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
       @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
