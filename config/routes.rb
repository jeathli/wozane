Rails.application.routes.draw do
  get 'welcome/index'

  namespace :blog do
    resources :articles
  end

  namespace :gallery do
    resources :photos
  end

  root 'welcome#index'
end
