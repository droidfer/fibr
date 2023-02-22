Rails.application.routes.draw do
  jsonapi_resources :contacts
  jsonapi_resources :departments
  jsonapi_resources :companies
  
end
