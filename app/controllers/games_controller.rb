class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @games = Game.all
      erb :'/games/index'
    else
      redirect to '/users/login'
    end
  end

  post '/games' do
    if logged_in?
      redirect to '/games/index'
    else
      redirect to '/users/signin'
    end
  end

  get '/games/index' do
    erb :'/games/index'
  end
end
