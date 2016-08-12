Rails.application.routes.draw do
  get 'menu/show'
  get 'welcome/index'
  get 'shop/index'
  get 'about/index'

  namespace :blog do
    resources :articles do
      resources :comments
    end
  end

  namespace :gallery do
    resources :photos
  end

  root 'welcome#index'
end
