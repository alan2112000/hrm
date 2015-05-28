Rails.application.routes.draw do
  root 'records#index'
  namespace :admin do
    resources :reports  do
      collection do
        get :generate
      end
    end
  end
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: 'log_in'
    get 'log_out', to: 'devise/sessions#destroy', as: 'log_out'
    get 'sign_up', to: 'users#new', as: 'sign_up'
  end

  resources :roles
  resources :user_role_relationships
  resources :types
  resources :users do
    resources :records
  end
end