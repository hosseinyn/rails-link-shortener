Rails.application.routes.draw do
  get "links/add" , to: "links#add"
  post "links/add" , to: "links#create"

  get "link/:short_link" , to: "links#show"

  get "login" , to: "user#signin"
  post "login" , to: "user#login"

  get "signup" , to: "user#signup"
  post "signup" , to: "user#register"

  get "dashboard" , to: "user#dashboard"
  get "logout" , to: "user#logout"

  post "delete-account" , to: "user#delete_account"

  get "change-password" , to: "user#changepassword"
  post "change-password" , to: "user#change_password"
  root "index#index"
end
