class GamesController < ApplicationController

  def new
    @game = Game.new
    @game.user = current_user
    @game.save!
    @cells = Array.new(9) { Cell.create!(content: '', game: @game) }.sort_by{|e| e[:id]}
  end

  def show
    @game = Game.find(params[:id])
    @cells = @game.cells.sort_by{|e| e[:id]}
  end

end
