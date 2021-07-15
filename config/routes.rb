Rails.application.routes.draw do
  root to: "home#index"

  get "home/index"
  get "home/about"
  get "home/history"
end
