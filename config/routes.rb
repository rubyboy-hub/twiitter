Rails.application.routes.draw do
  # devise_for :users
  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',only: [:create,:destroy,:show,:index]
  }
post '/tweets', to: 'tweets#create'
get '/member-data', to: 'members#show'
get '/tweets', to: 'tweets#show'
post '/tweets', to: 'tweets#create'
post '/follow', to: 'follow#create'
get '/follow/follow_tweets', to: 'follow#follow_tweets'
get '/member-data/:id', to: 'members#detailed_view'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
