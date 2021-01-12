class CellsController < ApplicationController
  def update
    @cell = Cell.find(params[:id])
    @cell.content = "O"
    @cell.save
    redirect_to game_path(@cell.game)
  end
end
