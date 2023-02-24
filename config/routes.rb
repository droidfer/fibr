Rails.application.routes.draw do
  resources :contacts
  resources :departments
  
  namespace :v1 do
    resources :companies
  end
end
