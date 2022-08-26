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
    @games = current_user.games.build(game_title: params[:game_title])
    @games.save
    redirect to '/games'
  end
  
  get '/games/:id/edit' do
    if logged_in?
      @games = Game.find_by_id(params[:id])
      if @games && @games.user = current_user
        erb :'games/edit'
      else
        redirect to '/login'
      end
    else
      redirect to '/login'
    end
  end

  patch '/games/:id' do
    if logged_in?
      @games = Game.find_by_id(params[:id])
      if @games && @games.user = current_user
        @games.update(game_title: params[:game_title])
        redirect to '/games'
      else
        redirect to '/login'
      end
    else
      redirect to '/login'
    end
  end

  delete '/games/:id/delete' do
    if logged_in?
      @games = Game.find_by_id(params[:id])
      if @games && @games.user = current_user
        @games.destroy
        redirect to '/games'
      else
        redirect to '/login'
      end
    else
      redirect to '/login'
    end
  end

end
