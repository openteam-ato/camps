Camps::Application.routes.draw do
  get 'ru/request' => 'requests#new', :as => :new_request
  post 'ru/request' => 'requests#create', :as => :create_request

  namespace :manage do
    resources :camps
  end

  get '/(*path)', :to => 'main#index'
end
