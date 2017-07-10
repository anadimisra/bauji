Rails.application.routes.draw do

  resources :discounts
  resources :coupons
  resources :tickets
  resources :learners
  resources :certifications
  resources :workshops
  devise_for :users
	root :to => 'certifications#index'

  resources :job_posts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
