Rails.application.routes.draw do
  devise_for :users, only: []

  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create] do
        collection do
          post :sign_in, controller: :sessions, action: :create
          post :teste
        end
      end

      resources :movies_api, only: [] do
        collection do
          get :fetch_by_name
        end
      end

      resources :favorites, only: [:index] do
        collection do
          put 'add/:movie_id', to: 'favorites#add'
          put 'remove/:movie_id', to: 'favorites#remove'
        end
      end

      resources :watch_laters, only: [:index] do
        collection do
          put 'add/:movie_id', to: 'watch_laters#add'
          put 'remove/:movie_id', to: 'watch_laters#remove'
        end
      end

      resources :watcheds, only: [:index] do
        collection do
          put 'add/:movie_id', to: 'watcheds#add'
          put 'remove/:movie_id', to: 'watcheds#remove'
        end
      end
    end
  end
end
