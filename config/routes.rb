DonovanYoung::Application.routes.draw do
  root to: "static_pages#home"
  match '/about',  to: "static_pages#about"
  match '/resume', to: "static_pages#resume"
end
