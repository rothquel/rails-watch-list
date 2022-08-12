Rails.application.routes.draw do
  root to: "movies#index"
  get 'bookmarks/new'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'bookmarks/index'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  resources :lists
  resources :bookmarks

  # view all
  get "/movies", to: 'movies#index'
  # view one
  get "/movies/:id", to: "movies#show"

end
