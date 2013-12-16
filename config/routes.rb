DonovanYoung::Application.routes.draw do

  # China Adventure
  resources :china, controller: 'china_adventures', only: :index do
    get ':page', action: :index, on: :collection
  end
  get '/china_adventures' => redirect('/china')

  # Personal Webpages
  get '/about',  to: "me#about"
  get '/resume', to: "me#resume"

  # Home Page
  root to: "me#home"

  comfy_route :cms_admin, :path => '/admin'

  # Make sure this routeset is defined last
  comfy_route :cms, :path => '/', :sitemap => false

end

