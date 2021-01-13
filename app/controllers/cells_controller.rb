class CellsController < ApplicationController
  def update
    @cell = Cell.find(params[:id])
    @cell.content = "O"
    @cell.save
    user_win

    if empty_cell_left?
      computer_plays
      computer_win
    else
      if @game.winner == ''
        @game.winner = "It's a tie"
        @game.finished = true
        @game.save!
      end
    end
      redirect_to game_path(@cell.game)
  end

  private

  def computer_plays
    @cells = Game.find(params[:game_id]).cells
    @empty_cells = @cells.select { |c| c.content == '' }
    @computer_cell = @empty_cells.sample
    @computer_cell.content = "X"
    @computer_cell.save!
  end

  def empty_cell_left?
    cells = Game.find(params[:game_id]).cells
    cells.select { |c| c.content == '' }.count > 0 ? true : false
  end

  def set_combination
    @game = Game.find(params[:game_id])
    cells_value = @game.cells.sort_by{|e| e[:id]}.map { |c| c.content }
    cells_row = cells_value.each_slice(3).to_a
    cells_col1 = [cells_value[0],cells_value[3],cells_value[6]]
    cells_col2 = [cells_value[1],cells_value[4],cells_value[7]]
    cells_col3 = [cells_value[2],cells_value[5],cells_value[8]]
    cells_diag1 = [cells_value[0],cells_value[4],cells_value[8]]
    cells_diag2 = [cells_value[2],cells_value[4],cells_value[6]]
    @cells_combinations = cells_row << cells_diag1 << cells_diag2 << cells_col1 << cells_col2 << cells_col3
  end

  def user_win
    set_combination
    if @cells_combinations.include?(["O", "O", "O"])
      @game.winner = 'You'
      @game.finished = true
      @game.save!
      current_user.score += 1
      current_user.save!
    end
  end

  def computer_win
    set_combination
    if @cells_combinations.include?(["X", "X", "X"])
      @game.winner = 'Computer'
      @game.finished = true
      @game.save!
    end
  end

end
