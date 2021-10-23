Rails.application.routes.draw do
  devise_for :users, only: []

  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create] do
        collection do
          post :sign_in, controller: :sessions, action: :create
        end
      end

      resources :movies, only: [] do
        collection do
          get :fetch_by_name
          get :fetch_popular
          get :my_lists
        end
      end

      resources :favorites, only: [:index] do
        collection do
          put 'add/:movie_id', to: 'favorites#add'
          put 'remove/:movie_id', to: 'favorites#remove'
          put 'handle/:movie_id', to: 'favorites#handle'
        end
      end

      resources :watch_laters, only: [:index] do
        collection do
          put 'add/:movie_id', to: 'watch_laters#add'
          put 'remove/:movie_id', to: 'watch_laters#remove'
          put 'handle/:movie_id', to: 'watch_laters#handle'
        end
      end

      resources :watcheds, only: [:index] do
        collection do
          put 'add/:movie_id', to: 'watcheds#add'
          put 'remove/:movie_id', to: 'watcheds#remove'
          put 'handle/:movie_id', to: 'watcheds#handle'
        end
      end
    end
  end
end
