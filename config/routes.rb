Orderstuff::Application.routes.draw do


  # post 'search' => 'orders#search"

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    authenticated :user do
      root :to => 'orders#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unathenticated_root
    end
    get    "login"   => "devise/sessions#new",         as: :new_user_session
    post   "login"   => "devise/sessions#create",      as: :user_session
    delete "signout" => "devise/sessions#destroy",     as: :destroy_user_session

    get    "signup"  => "devise/registrations#new",    as: :new_user_registration
    post   "signup"  => "devise/registrations#create", as: :user_registration
    put    "signup"  => "devise/registrations#update", as: :update_user_registration
    get    "account" => "devise/registrations#edit",   as: :edit_user_registration
  end

  get  '/buy/:tracking', to: 'transactions#new',      as: :show_buy
  post '/buy/:tracking', to: 'transactions#create',   as: :buy
  get  '/pickup/:guid',   to: 'transactions#pickup',   as: :pickup

  resources :sales
  resources :orders

  get 'pages/tos' => 'high_voltage/pages#show', id: 'tos'
  get 'pages/how' => 'high_voltage/pages#show', id: 'how'
  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  get 'pages/contact' => 'high_voltage/pages#show', id: 'contact'
  get 'pages/lookup' => 'high_voltage/pages#show', id: 'lookup'
  get 'pages/estimate' => 'high_voltage/pages#show', id: 'estimate'
  get 'pages/restricted' => 'high_voltage/pages#show', id: 'restricted'
end
