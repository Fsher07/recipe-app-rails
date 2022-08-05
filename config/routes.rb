# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipe_foods
  resources :foods
  devise_for :users, controllers: { registrations: 'registrations' }
 
  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :show, :new, :create, :destroy, :edit ] do
      member do
        patch :update_status
      end
    end
  end
  root 'home#index'
  resources :public_recipes, only: [:index]
end
