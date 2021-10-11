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
    end
  end
end
