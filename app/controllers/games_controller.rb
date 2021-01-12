class GamesController < ApplicationController
  def new
    @cells = Array.new(9) { Cell.new }
  end



end
