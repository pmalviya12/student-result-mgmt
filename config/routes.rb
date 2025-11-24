Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :results, only: [:create, :index]
    end
  end
end