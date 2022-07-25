class UsersController < ApplicationController

  get '/users/:id' do
    if !logged_in?
      redirect '/games'
    end

  post '/users/:id'
    @user = User.create(params[:id])
    if !@user.nil? && @user == current_user
      erb :users/show
    else
      redirect '/games'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
