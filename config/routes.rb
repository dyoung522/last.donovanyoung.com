DonovanYoung::Application.routes.draw do
  resources :china_adventures

  match '/about',  to: "static_pages#about"
  match '/resume', to: "static_pages#resume"

  root to: "static_pages#home"
end
