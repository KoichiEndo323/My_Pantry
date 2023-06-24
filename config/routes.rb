Rails.application.routes.draw do

  # 顧客用
  devise_for :end_users, controllers: {
  registrations: "public/registrations",sessions: 'public/sessions'
}

  #ゲストログイン用
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
    delete 'end_users/guest_sign_out', to: 'public/sessions#guest_sign_out'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :foods
      resources :storages, only:[:index]

    resources :articles do
      resources :post_comments, only:[:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end

    resources :end_users, only: [:edit, :update] do
      collection do
        get 'mypage' => 'end_users#show', as: 'mypage'
        get 'check' => 'end_users#check'
        patch  'withdraw' => 'end_users#withdraw'
      end
    end
    resources :menus

    resources :notifications, only: [:index, :destroy]
    delete 'notifications/destroy_all' => 'notifications#destroy_all', as: 'destroy_all_notifications'

    get "search" => "searches#search"
    get "search_article_tag" => "article_seaches#search_tag"
    get "search_food" => "food_seaches#seach_food"
  end

  # 管理者用
  devise_for :admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
