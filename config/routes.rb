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

  scope module: :public do
    root to: 'homes#top'
    # URL/users...
      resources :users, only: [:show, :edit, :update] do
        get 'unsubscribe'
        patch 'withdraw'
        resources :bookmarks, only: [:index]
      end

    resources :saunas, only: [:index, :show] do
      resources :reviews, except: [:index] do
        resources :comments, except: [:index]
        resource :favorites, only: [:create, :destroy]
      end
      resource :bookmarks, only: [:create, :destroy]
    end

  end

  namespace :admin do
    get 'homes/top'
    # URL/admin/saunas...
    resources :saunas, except: [:destroy] do
      resources :reviews, only: [:show, :destroy] do
        resources :comments, only: [:destroy]
      end
    end
    # URL/admin/reviews...
    resources :reviews, only: [:index]
    # URL/admin/users...
    resources :users, except: [:destroy]
    # URL/admin/genres...
    resources :genres, only: [:index, :create, :edit, :update, :destroy]

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
