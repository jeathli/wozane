Rails.application.routes.draw do
  get 'menu/show'

  get 'welcome/index'

  namespace :blog do
    resources :articles
  end

  namespace :gallery do
    resources :photos
  end

  root 'welcome#index'
end
