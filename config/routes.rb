Camps::Application.routes.draw do

  get 'ru/request' => 'requests#new', :as => :new_request
  post 'ru/request' => 'requests#create', :as => :create_request

  scope 'ru' do
    resources :camps, :only => [:index, :show]
  end

  namespace :manage do
    resources :camps do
      resources :photos
    end
    root :to => 'camps#index'
  end

  get '/(*path)', :to => 'main#index'
end
