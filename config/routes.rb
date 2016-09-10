Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:new, :create]
resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
end

resources :ideas do
  resources :comments
  resources :likes, only: [:create, :destroy]
  resources :memberships, only: [:create, :destroy]

end

root "ideas#index"

end
