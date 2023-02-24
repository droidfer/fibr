Rails.application.routes.draw do
  namespace :v1 do
    resources :companies
    resources :departments
    resources :contacts
  end
end
