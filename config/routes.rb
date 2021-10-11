Rails.application.routes.draw do
  resources :portfolio_sections, except: [:show]
  get 'portfolio_section/:id', to: 'portfolio_sections#show', as: 'portfolio_section_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
