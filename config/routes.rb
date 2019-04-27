Rails.application.routes.draw do
  namespace :api do
    post '/users' => 'users/create'

    get '/credit_cards' => 'credit_cards/index'
    post '/credit_cards' => 'credit_cards/create' 
    get '/credit_cards/:id' => 'credit_cards/show'
    patch '/credit_cards/:id' => 'credit_cards/update'
    delete '/credit_cards/:id' => 'credit_cards/destroy'

    get '/charges' => 'charges/index'
    post '/charges' => 'charges/create'
    get '/charges/:id' => 'charges/show'

    get '/payments' => 'payments/index'
    post '/payments' => 'payments/create'
    get '/payments/:id' => 'payments/show'
    patch '/payments/:id' => 'payments/update'
    delete '/payments/:id' => 'payments/destroy'
  end
end
