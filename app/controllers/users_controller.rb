class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/games'
    end

  post '/users/:id'
    @user = User.create(params[:id])
    if !@user.nil? && @user == current_user
      erb :index
    else
      redirect '/games'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
