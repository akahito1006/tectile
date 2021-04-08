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

  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about'
    resources :articles,  only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :users,     only: [:show, :edit, :update, :destroy]
    resource  :likes,     only: [:create, :destroy]
    resources :comments,  only: [:create, :destroy]
    get '/users/unsubscribe' => 'users#unsubscribe'
    get '/search' => 'searches#search'
  end

  namespace :admin do
    resources :articles,  only: [:index, :show, :edit, :update, :destroy]
    resources :users,     only: [:index, :show, :edit, :update, :destroy]
    get '/users/unsubscribe' => 'users#unsubscribe'
    get '/search' => 'searches#search'
  end
  
end
