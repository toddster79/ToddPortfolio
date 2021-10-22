Rails.application.routes.draw do
  resources :portfolio_sections, except: [:show]
  get 'angular-items', to: "portfolio_sections#angular"
  get 'portfolio_section/:id', to: 'portfolio_sections#show', as: 'portfolio_section_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
