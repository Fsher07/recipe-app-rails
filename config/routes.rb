# frozen_string_literal: true

Rails.application.routes.draw do
  resources :foods
  devise_for :users, controllers: { registrations: 'registrations' }
 
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :edit ] do
      member do
        patch :update_status
      end
      resources :recipe_foods, only: %i[new create destroy edit update]
    end

  root 'public_recipes#index'
  resources :public_recipes, only: [:index]

  get 'recipes/:id/shopping_list', to: 'recipes#shopping_list' , as: :recipe_shopping_list
end
