Rails.application.routes.draw do
  root to: 'welcome#index'
  post '/', to: 'welcome#search'
  post '/songs', to: 'welcome#get_songs'
  post '/update', to: 'welcome#update'

  get "/playlists", to: "playlists#index", as: "playlists"

  get "/playlists/new", to: "playlists#new", as: "new_playlist"

  post "/playlists", to: "playlists#create"

  get "/playlists/arr", to: "playlists#toArray", as: "playlist_arr"

  get "/playlists/:id", to: "playlists#show", as: "playlist"


end
