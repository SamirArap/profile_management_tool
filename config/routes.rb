Rails.application.routes.draw do

  devise_scope :user do
    root to: "users/sessions#new"
  end
  root to: "users/sessions#new"

  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'},
             path: '', path_names: {sign_in: 'login', sign_up: 'register'}



  resources :profiles, only: [:index]

end
