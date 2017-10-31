Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	resources :users, only: [:index]
    resources :jobs

 	root to: "admins#index"

 	resources :admins



end
