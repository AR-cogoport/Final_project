Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # connect_tables
 get "/connect_tables" , to: "connect_tables#index"

  # articles
  get  "/articles" , to: "article#index"
  get  "/articles/:id" , to: "article#find"
  post "/articles/add" , to: "article#add"
  put "/articles/update/:id", to: "article#update"
  put "/articles/edit" , to: "article#edit"
  delete "/articles/delete/:id" , to: "article#delete"
  get "/articles/find_all_cat/:id" , to: "article#find_all_cat"

  # Category

  # get "/category", to: "category#create"
  get "/category" , to: "category#index"
  post "/category/add", to: "category#add"
  put "/category/update", to: "category#update"
  delete "/category/delete/:id", to: "category#delete"

  #Authors

  get "/authors" , to: "authors#index"
  get "/authors:id" , to: "authors#find"
  post "/authors/add" , to: "authors#add"
  put "/authors/update/:id" , to: "authors#update"
  delete "/authors/delete/:id" , to: "authors#delete"
  post "/authors/set_user" , to: "authors#set_user"
  get "/authors/find_articles_by_author/:id" , to: "authors#find_articles_by_author"


  #  authentication jwt 
  resources :authors, param: :name
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'





end
