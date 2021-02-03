Rails.application.routes.draw do

  get 'views/index'
  root to: "views#index"
  #get 'views/:id', to: 'views#show'
  #resources :people
  get 'people/:id', to: 'people#show'

end
