Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "chatroom#index"
  post "/", to: "chatroom#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#destroy"

  mount ActionCable.server, at: "/cable"
end
