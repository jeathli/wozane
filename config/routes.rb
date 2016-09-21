Rails.application.routes.draw do
  get 'home' => 'static_pages#home'
  get 'shop' => 'static_pages#shop'
  get 'about' => 'static_pages#about'

  get 'login' => 'session#login'
  post 'login' => 'session#create'
  delete 'logout' => 'session#logout'

  resources :photos

  namespace :blog do
    resources :articles
  end

  root 'static_pages#welcome'
end
