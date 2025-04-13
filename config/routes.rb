Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
