DonovanYoung::Application.routes.draw do
  resources :china_adventures, only: :index

  match '/about',  to: "me#about"
  match '/resume', to: "me#resume"

  root to: "me#home"
end
