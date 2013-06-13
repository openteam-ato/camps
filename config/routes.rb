Camps::Application.routes.draw do
  scope 'ru' do
    get 'request' => 'requests#new', :as => :new_request
    post 'request' => 'requests#create', :as => :create_request

    get 'camps'      => 'camps#index', :as => :camps
    get 'camps/view' => 'camps#show', :as => :camp
    get 'camps/register' => 'camps#register', :as => :register
  end

  namespace :manage do
    resources :camps do
      resources :photos
    end

    resources :registers, :only => [:index, :edit, :update, :destroy]

    root :to => 'camps#index'
  end

  get '/(*path)', :to => 'main#index'
end
