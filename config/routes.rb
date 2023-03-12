Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    password: 'admin/passwords',
    registrations: 'admin/registrations'

  # ユーザー用
  # URL /users/sign_in ...
  }
  devise_for :users, controllers: {
    sessions: 'public/sessions',
    password: 'public/passwords',
    registrations: 'public/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
