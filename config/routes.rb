DonovanYoung::Application.routes.draw do
  # China Adventure
  resources :china, controller: 'china_adventures', only: :index do
    get ':page', action: :index, on: :collection
  end
  match '/china_adventures' => redirect('/china')

  # Personal Webpages
  match '/about',  to: "me#about"
  match '/resume', to: "me#resume"

  # Home Page
  root to: "me#home"
end
