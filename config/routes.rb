Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolio_sections, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: "portfolio_sections#angular"

  # Specific route that takes in an :id parameter, and is mapped to the show action
  get 'portfolio_section/:id', to: 'portfolio_sections#show', as: 'portfolio_section_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'


  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'
end
