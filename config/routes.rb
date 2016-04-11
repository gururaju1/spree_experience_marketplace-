Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :marketplace_settings
    resources :experiences do
      resources :bank_accounts, controller: 'experience_bank_accounts'
    end
  end
  resources :experiences, only: [:create, :new, :index, :show]
end
