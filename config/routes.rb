
Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    get 'check_csv', on: :member
    get 'download_csv', on: :member


  end
end
