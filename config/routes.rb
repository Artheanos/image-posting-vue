# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome', to: 'welcome#index'

  namespace :api, defaults: { format: :json } do
    resources :image_posts, only: %i[create index show] do
      get :avatar, on: :member
    end
  end
end
