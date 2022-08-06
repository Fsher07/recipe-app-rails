class RecipeFood < ApplicationRecord
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :recipe
  belongs_to :food
end
