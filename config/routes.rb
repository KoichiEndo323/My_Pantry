Rails.application.routes.draw do
  # 顧客用
  devise_for :end_users,skip: [:passwords], controllers: {
  registrations: "public/registrations",sessions: 'public/sessions'
}
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end



get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
