Rails.application.routes.draw do
  get "links/add"
  get "login" , to: "user#signin"
  post "login" , to: "user#login"

  get "signup" , to: "user#signup"
  post "signup" , to: "user#register"

  get "dashboard" , to: "user#dashboard"
  get "logout" , to: "user#logout"

  post "delete-account" , to: "user#delete_account"
  root "index#index"
end
