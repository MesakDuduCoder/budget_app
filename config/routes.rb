Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise#login_or_signup', as: :unauthenticated_root
    end

    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  resources :categories do
    resources :payments
  end
end
