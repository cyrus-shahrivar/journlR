Rails.application.routes.draw do

  get 'signup'  => 'users#new'
  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users do
    resources :articles 
  end

  root 'welcome#index'

end
