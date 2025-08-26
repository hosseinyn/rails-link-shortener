Rails.application.routes.draw do
  get "links/add"
  get "user/login"
  root "index#index"
end
