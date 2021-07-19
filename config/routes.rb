Rails.application.routes.draw do
  root to: "home#index"

  get "home/index"
  get "home/about"
  get "home/history"

  post "page_view", to: "home#page_view"
end
