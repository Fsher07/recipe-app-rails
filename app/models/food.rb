class Food < ApplicationRecord
  validates :name, :measurement_unit, presence: true, length: { minimum: 3, maximum: 50 }
  validates :price, :quantity, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :user, optional: true
  # has_many :recipe_foods, dependent: :destroy
end
