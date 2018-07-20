Rails.application.routes.draw do

  #root to: 'pages#home'
  root to: 'submissions#new'
  get '/dashboard' => 'pages#home', as: 'dashboard'
  get '/about' => 'pages#about', as: 'about'
  get '/help' => 'pages#help', as: 'help'
  post '/results/export', to: 'results#export', as: 'checked_result'

  devise_for :users
  resources :users do
    get :get, on: :collection
  end
  resources :submissions
  resources :genes do
    get :get, on: :collection
  end
  resources :results
  resources :strains
  resources :offsite_searches
  resources :custom_target_submissions
  resource :messages, only: %i[new create]
	
end
