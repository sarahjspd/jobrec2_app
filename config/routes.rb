Rails.application.routes.draw do
  devise_for :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	resources :users, only: [:index]
    resources :jobs
    resources :skill_scores
    resources :category_scores

 	root to: "jobs#index"

 	resources :admins
 	resources :jobapplication, only: [:create, :index]
 	resources :recrefreshes, only: [:create]



end
