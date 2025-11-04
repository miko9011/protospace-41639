Rails.application.routes.draw do
  devise_for :users

  resources :prototypes do
    resources :comments, only: [:create]  # コメント投稿用ルーティング
  end

  resources :users, only: [:show]

  get 'messages/index'
  get "up" => "rails/health#show", as: :rails_health_check

  root "prototypes#index"
end
