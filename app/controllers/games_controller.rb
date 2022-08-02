class GamesController < ApplicationController

  get '/games' do
    redirect_if_not_logged_in
    @games = current_user.games
    erb :'games/index'
  end

  post '/games' do
    redirect to "/games"
  end

  get '/games/index' do
    redirect to '/games'
  end

  get '/games/new' do
    erb :'games/new'
  end

  post '/games/new' do
    @games = Game.new(game_title: params[:game_title])
    @games.save
    redirect to '/games'
  end

  get '/games/:id/edit' do
    erb :'games/edit'
  end

  post '/games/edit' do
    @games = Game.new(game_title: params[:game_title])
    @games.save
    redirect to '/games'
  end

end
