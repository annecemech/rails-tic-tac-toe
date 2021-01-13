class GamesController < ApplicationController
  def new
    @game = Game.new
    @game.user = current_user
    @game.winner = ''
    @game.save!
    @cells = Array.new(9) { Cell.create!(content: '', game: @game) }.sort_by{|e| e[:id]}
  end

  def show
    if params[:id]
      @game = Game.find(params[:id])
    else
      new
    end
    @cells = @game.cells.sort_by{|e| e[:id]}
  end

  def replay
    new
    @cells = @game.cells.sort_by{|e| e[:id]}
    redirect_to game_path(@game)
  end

end
