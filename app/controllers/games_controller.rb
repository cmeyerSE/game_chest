class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @games = current_user.games
      erb :'games/index'
    else
      redirect to '/login'
    end
  end

  post '/games' do
    if logged_in?
      redirect to "/games"
    else
      redirect to '/login'
    end
  end

  get '/games/index' do
    if logged_in?
      redirect to '/games'
    else
      redirect to '/login'
    end
  end

  get '/games/new' do
    if logged_in?
      erb :'games/new'
    else
      redirect to '/login'
    end
  end

  post '/games/new' do
    if logged_in?
      if params[:game_title] == ""
        redirect to "/games/new"
      else
        @games = current_user.games.build(game_title: params[:game_title])
        @games.save
        redirect to '/games'
      end
    else
      redirect to '/login'
    end
  end
  
  get '/games/:id/edit' do
    if logged_in?
      @games = Game.find_by_id(params[:id])
      if @games && @games.user == current_user
        erb :'games/edit'
      else
        redirect to '/failure'
      end
    else
      redirect to '/login'
    end
  end

  patch '/games/:id' do
    if logged_in?
      if params[:game_title] == ""
        redirect to "/games/#{params[:id]}/edit"
      else
        @games = Game.find_by_id(params[:id])
        if @games && @games.user == current_user
          @games.update(game_title: params[:game_title])
          redirect to '/games'
        else
          redirect to '/failure'
        end
      end
    else
      redirect to '/login'
    end
  end

  delete '/games/:id/delete' do
    if logged_in?
      @games = Game.find_by_id(params[:id])
      if @games && @games.user == current_user
        @games.delete
        redirect to '/games'
      else
        redirect to '/failure'
      end
    else
      redirect to '/login'
    end
  end

end
