Rails.application.routes.draw do

  # Orders
  get 'orders', to: "orders#index", as: "orders"
  post 'orders', to: "orders#create"
  get 'orders/:id/edit', to: "orders#edit", as: "edit_order"
  get 'orders/:id', to: "orders#show", as: "order"
  put 'orders/:id', to: "orders#update"
  patch 'orders/:id', to: "orders#update"

  # Learners
  get 'learners', to: "learners#index", as: "learners"
  post 'learners', to: "learners#create"
  get 'learners/:id/edit', to: "learners#edit", as: "edit_learner"
  get 'learners/:id', to: "learners#show", as: "learner"
  put 'learners/:id', to: "learners#update"
  patch 'learners/:id', to: "learners#update"

  resources :offers
  resources :discounts
  resources :coupons
  resources :certifications
  resources :workshops
  resources :job_posts
  #devise_for :users
	root :to => 'certifications#index'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
