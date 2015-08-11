Rails.application.routes.draw do

  get 'sessions/new'
  root "welcomes#new"
  get 'new' =>'sessions#new' 
  


  resources :sessions
  resources :books 
  resources :admin
  resources :welcomes


  resources :books do
    post :search, on: :collection
    post :live_search, on: :collection
  end

  resources :users do
    post :remove_user_book, on: :member
  end


  resources :admin do
    post :book_remove, on: :collection
  end

  resources :admin do
    post :book_search, on: :collection
  end

  resources :admin do
    post :book_add, on: :member
  end

  resources :admin do
    get :book_show, on: :member
  end

  resources :admin do
    get :user_show, on: :member
  end

  resources :admin do
    post :user_remove, on: :member
  end

  resources :admin do
    post :user_add, on: :member
  end
  resources :admin do
    get :user_post, on: :member
  end
end
