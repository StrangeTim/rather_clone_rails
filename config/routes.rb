Rails.application.routes.draw do
  root 'questions#index'
  devise_for :users
  resources :questions do
    resources :votes, only: [:create, :edit, :update]
    resources :comments, except: [:show, :index]
  end
end
