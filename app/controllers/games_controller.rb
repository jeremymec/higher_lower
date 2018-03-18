class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def create
    game = Game.create
    game.create_secret(game.id)
    redirect_to(game)
  end

  def show
    @game = Game.find(params[:id])
    if @game.game_lost(@game.id)
      defeat
    elsif @game.game_won(@game.id)
      victory
    else
      @result = @game.last_guess_result(@game.id)
    end
  end

  def victory
    render "victory"
  end

  def defeat
    render "defeat"
  end

end
