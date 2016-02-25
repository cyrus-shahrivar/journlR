Rails.application.routes.draw do

  get 'signup'  => 'users#new'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users

  resources :articles do
    resources :comments
  end

  root 'welcome#index'

end
