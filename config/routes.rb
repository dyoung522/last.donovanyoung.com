DonovanYoung::Application.routes.draw do
  root to: "static_pages#home"
  match '/resume', to: "static_pages#resume"
end
