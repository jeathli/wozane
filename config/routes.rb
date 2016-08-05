Rails.application.routes.draw do
  get 'welcome/index'

  namespace :gallery do
    resources :photos
  end

  root 'welcome#index'
end
