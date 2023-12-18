Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do

    namespace :auth do
      post 'login' , action: :login , controller: :auth
    end

    namespace :v1 do
      get 'get_users' , action: :getUsers , controller: :users
      post 'add_user', action: :addUser , controller: :users
      get 'show_user' , action: :show , controller: :users
      put 'update_user' ,action: :updateUser , controller: :users
      delete 'delete_user' , action: :deleteUser , controller: :users

    end

  end

end
