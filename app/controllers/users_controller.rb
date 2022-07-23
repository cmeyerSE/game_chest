class UsersController < ApplicationController

  get "/users/signup" do
    erb :'users/signup'
  end

  post "/users/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/games'
    end
  end

  get '/users/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/games'
    end
  end

  post '/users/login' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/users/signup'
    else
      @user = User.create(:username => params[:username], :password_digest => params[:password_digest])
      session[:user_id] = @user.id
      redirect '/games'
    end
  end

  get '/logout' do
    session.destroy
    redirect to 'users/signin'
end

end
