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
    end
  end
end
