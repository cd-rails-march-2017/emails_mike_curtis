Rails.application.routes.draw do
  root 'messages#index'

  get 'messages/new' => 'messages#new'
  post 'messages' => 'messages#create'
  get 'messages/outbox' => 'messages#outbox'
  get 'messages/:id' => 'messages#show'

  get 'sessions' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
