class Recipe < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  belongs_to :user
  # has_many :recipe_foods, dependent: :destroy
end
