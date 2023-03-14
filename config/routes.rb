Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: %i[index create update show destroy]

  resources :projects, only: %i[index show create update destroy] do
    get 'conversations', to: 'projects#conversation'
    resources :comments, only: %i[index create update destroy]
  end
end
