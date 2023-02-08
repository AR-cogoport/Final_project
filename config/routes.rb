Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # connect_tables
 get "/connect_tables" , to: "connect_tables#index"

  # articles
  get  "/articles" , to: "article#index"
  post "/articles/add" , to: "article#add"
  put "/articles/update", to: "article#update"
  put "/articles/edit" , to: "article#edit"
  delete "/articles/delete" , to: "article#delete"

  # Category

  # get "/category", to: "category#create"
  get "/category" , to: "category#index"
  post "/category/add", to: "category#add"
  put "/category/update", to: "category#update"
  delete "/category/delete/", to: "category#delete"

  #Authors

  get "/authors" , to: "authors#index"
  post "/authors/add" , to: "authors#add"
  delete "/authors/delete" , to: "authors#delete"
  post "/authors/find_articles_by_author" , to: "authors#find_articles_by_author"

  #  authentication jwt 
  resources :authors, param: :name
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'





end
