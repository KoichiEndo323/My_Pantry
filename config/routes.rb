Rails.application.routes.draw do
  # 顧客用
  devise_for :end_users, controllers: {
  registrations: "public/registrations",sessions: 'public/sessions'
}

  #ゲストログイン用
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :foods, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :storages, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :articles, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :post_comments, only:[:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    get 'end_users/mypage' => 'end_users#show', as: 'mypage'
    resources :menus, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :notifications, only: [:index, :create, :show, :destroy]
    
  end




  # 管理者用
  devise_for :admin,controllers: {
  sessions: "admin/sessions"
}




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
