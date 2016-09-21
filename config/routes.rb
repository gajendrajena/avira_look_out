Rails.application.routes.draw do
  resources :webcams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#index"
end
