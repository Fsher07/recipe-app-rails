class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }

  def recent_recipes
    recipes.order(created_at: :desc)
  end

  def admin?
    # role == requested.role.to_s
    :role == 'admin'
  end
end
