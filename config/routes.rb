Rails.application.routes.draw do
  namespace :v1, defaults: {format: :json} do
    resources :companies
    resources :departments
    resources :contacts
  end
end
