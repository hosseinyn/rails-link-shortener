Rails.application.routes.draw do
  get "links/add"
  get "login" , to: "user#signin"
  post "login" , to: "user#login"

  get "signup" , to: "user#signup"
  post "signup" , to: "user#register"
  root "index#index"
end
