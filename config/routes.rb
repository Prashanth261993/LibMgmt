Rails.application.routes.draw do

  
  devise_for :users
  root "users#show"

  resources :books 
  resources :admin
  


  resources :books do
    post :search, on: :collection
    post :live_search, on: :collection
    post :remove_books, on: :collection
    post :add_books_to_user, on: :collection
  end

  resources :users do
    post :remove_user_book, on: :member
  end

  resources :admin do

    get :user_post, on: :member
  end

end
