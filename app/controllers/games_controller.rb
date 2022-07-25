class GamesController < ApplicationController

  get '/games' do
    redirect_if_not_logged_in
    @games = Game.all
    erb :'games/index'
  end

  post '/games' do
    erb :'games/index'
  end

  get '/games/index' do
    erb :'games/index'
  end

  get '/games/new' do
    erb :'games/new'
  end

  post '/games/new' do
    @games = Game.new(:game_title => params[:game_title])
    @games.save
    redirect to '/games/index'
  end

  get '/games/:id/edit' do
    erb :'games/edit'
  end

  post '/games/edit' do
    erb :'games/index'
  end

end
