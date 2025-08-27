Rails.application.routes.draw do
  get "links/add"
  get "login" , to: "user#signin"
  post "login" , to: "user#login"
  root "index#index"
end
