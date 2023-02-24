Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "tweet_scheduler#index"
  get 'about', to: 'tweet_scheduler#about'
  get 'pricing', to: 'tweet_scheduler#pricing'


  get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  resources :twitter_accounts do
   # delete ':id/destroy', to: 'dashboard#destroy', as: 'delete_twiiter'
  end

  delete '/twitter_accounts/:id/destroy', to: 'twitter_accounts#destroy', as: 'delete_twitter'

  resources :tweets do

  end
end
