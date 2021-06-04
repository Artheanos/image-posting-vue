# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :image_posts, only: %i[create index show destroy] do
      get :avatar, on: :member
    end

    resources :comments, only: %i[create destroy]
  end

  namespace :rails do
    get '/*path', to: ActiveStorage::Engine
  end

  root 'welcome#index'
  get '*all', to: 'welcome#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
