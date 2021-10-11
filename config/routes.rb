Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create] do
        collection do
          get :teste
        end
      end
    end
  end
end
