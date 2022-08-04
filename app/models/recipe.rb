class Recipe < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }

  belongs_to :user
end
