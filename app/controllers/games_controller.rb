class GamesController < ApplicationController

  get '/games' do
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
    @games = current_user.games.build(game_title: params[:game_title], user_id: params[:user_id])
    @games.save
    redirect to '/games'
  end
  
  get '/games/:id/edit' do
    @games = Game.find_by_id(params[:id])
    erb :'games/edit'
  end

  post '/games/edit' do
    @games = current_user.games.update(game_title: params[:game_title])
    redirect to '/games'
  end

end
