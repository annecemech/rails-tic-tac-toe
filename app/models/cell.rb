class Cell < ApplicationRecord
  belongs_to :game

  def new
    @cell = Cell.new
  end

  def update

  end
end
