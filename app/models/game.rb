class Game < ApplicationRecord
  belongs_to :user
  has_many :cells, dependent: :destroy
end
