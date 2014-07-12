Rails.application.routes.draw do

  root to: "pages#landing"

  scope 'auth' do
    get "/google_oauth2/callback", to: "sessions#create"
    get "/signout", to: "sessions#destroy", as: "signout"
    get "/failure", to: redirect("/")
  end

  resources :users, except: [:create, :destroy]
  resources :items
end
