Rails.application.routes.draw do
  resources :clientes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "update_all_name", to: "clientes#update_all_name"
end
