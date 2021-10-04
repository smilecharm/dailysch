Rails.application.routes.draw do
  resources :dailysches do
    collection do
      get :grid
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
