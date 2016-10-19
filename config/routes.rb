Rails.application.routes.draw do
  resources :coaches
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :members, controllers: {registrations: "registrations"}
  resources :questions
  get 'static_pages/faq'
  get 'static_pages/about'
  get 'static_pages/rgla'
  get 'users/accepted'
  get 'users/pending'
  root 'static_pages#home'
  resources :users do
    resources :tutorials, only: [:show, :update, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
