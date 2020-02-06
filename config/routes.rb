Rails.application.routes.draw do

  devise_for :users
  root to: "tops#index"
  namespace :flows do
    resources :searches, only: :index
  end 

  resources :flows do
    collection do
      get 'report' 
    end 
  end   
end
