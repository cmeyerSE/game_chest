class GamesController < ApplicationController

  get '/games' do
    redirect_if_not_logged_in
    @games = Game.all
    erb :'games/index'
  end

  post '/games' do
    
  end

  get '/games/index' do
    erb :'games/index'
  end

  get '/games/new' do
    erb :'games/new'
  end

  post '/games/new' do
    @games = Game.create(:game_title => params[:game_title])
    @games.save
    erb :'/games/index'
  end

  get '/games/:id/edit' do
    erb :'games/edit'
  end

  post '/games/@game.id' do
    erb :'games/index'
  end

end
