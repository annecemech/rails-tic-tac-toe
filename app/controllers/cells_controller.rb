class CellsController < ApplicationController
  def update
    @cell = Cell.find(params[:id])
    @cell.content = "O"
    @cell.save
    redirect_to game_path(@cell.game)
  end

  def empty_cell?
    @cell.content == ''
  end

  def computer_plays
  end

end
