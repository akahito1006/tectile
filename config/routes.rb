Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    sessions:       'admin/sessions',
    passwords:      'admin/passwords',
    registrations:  'admin/registrations'
  }
  devise_for :users, controllers: {
    sessions:       'public/sessions',
    passwords:      'public/passwords',
    registrations:  'public/registrations'
  }
  
# 管理者ゲストログイン
  devise_scope :admin do
    post '/admin/guest_session' => 'admin/sessions#guest_session'
  end
# 会員ゲストログイン
  devise_scope :user do
    post '/users/guest_session' => 'public/sessions#guest_session'
  end

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :articles,  only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :users,     only: [:show, :edit, :update, :destroy]
    resource  :likes,     only: [:create, :destroy]
    resources :comments,  only: [:create, :destroy]
    get '/user/unsubscribe' => 'users#unsubscribe'
    get '/search' => 'searches#search'
  end

  namespace :admin do
    resources :articles,  only: [:index, :show, :edit, :update, :destroy]
    resources :users,     only: [:index, :show, :edit, :update, :destroy]
    get '/search' => 'searches#search'
  end
  
end
