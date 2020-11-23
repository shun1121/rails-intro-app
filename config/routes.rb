Rails.application.routes.draw do
  resources :intros
  devise_for :users #:usersは何を表している？->usersテーブル
  root 'devises#index'
  get 'devises/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
