Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :companies
    resources :departments
    resources :contacts do
      get :departments, on: :member # This is to return all options to assign a department
    end
  end
end
