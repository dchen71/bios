Rails.application.routes.draw do
  root 'static_pages#index'
  get 'search' => 'static_pages#search'
end
