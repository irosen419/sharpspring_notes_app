Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users
  resources :notes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
