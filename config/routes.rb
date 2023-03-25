Rails.application.routes.draw do


  namespace :public do
    get 'saunas/index'
    get 'saunas/show'
  end
  scope module: :public do
    root to: 'homes#top'
    # URL/users...
    get 'users/my_page' => "users#show", as: "my_page"
    get 'users/information/edit' => "users#edit"
    patch 'users/information' => "users#update"
    get 'users/unsubscribe'
    patch 'users/withdraw'
    resources :saunas, except: [:destroy]

  end

  namespace :admin do
    get 'homes/top'
    # URL/admin/saunas...
    resources :saunas, except: [:destroy]
    resources :users, except: [:destroy]

    # URL/admin/genres...
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :areas, only: [:index, :create, :edit, :update, :destroy]

  end

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
