Rails.application.routes.draw do

  devise_for :users
	root :to => 'certification#index'

  resources :certifications
  resources :job_posts
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
