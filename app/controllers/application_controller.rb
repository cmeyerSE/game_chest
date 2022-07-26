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
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(username: params["username"], password: params["password"])
      @user.save
      session[:user_id] = @user.id
      redirect '/login'
    end
  end

  get '/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :login
    else
      redirect '/games'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/games'
    else
      redirect to '/signup'
    end
  end

  helpers do
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You have to be logged in to do that"
      end
    end

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user = User.find(session[:user_id])
    end
  end

end
