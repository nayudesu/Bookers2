Rails.application.routes.draw do
  devise_for :users    #devise を使用する際に URL として users を含むことを示す

  resources :users, only: [:show, :update, :edit]
  resources :books, only: [:new, :index, :show, :destroy, :create]
  root to: 'homes#top'
  get 'homes/about' => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
