Rails.application.routes.draw do
  # 顧客用
  devise_for :end_users, controllers: {
  registrations: "public/registrations",sessions: 'public/sessions'
}
  scope module: :public do
    root 'homes#top'
    
    
  end









  # 管理者用
  devise_for :admin,controllers: {
  sessions: "admin/sessions"
}
  #ゲストログイン用
devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
