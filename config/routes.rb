Rails.application.routes.draw do

  resources :categories
  #la base de una aplicación en rails es REST, REST es la arquitectura del proyecto ademas del MVC que son arquitecturas distintas es decir enfrentar problemas distintos
  # Rest es mas como se organizan las rutas, los controladores y como se tiene que ver con el modelo de
  # y el MVC Es mas como organizar el codigo, nuestro proyecto esta pensado en rest es decir que pasarlo a REST de ruby on rails va hacer muy facil
  #ahora ya estamos usando REST solo que no es explicito y esto nos va ahorrar mucho codigo con "resources"
  # lo mas recomendable es respetar arquitectura rest tanto como se posible

  devise_for :users
  root to: "home#index"
  get "bienvenida", to: "home#index" #esto no es rest es solo una ruta de un landing pague no es un ruta que estamos modificando  | NO ES UN CRUD 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :articles          #al poner esto ya comento lo de abajo, solo esto hace todo lo de abajo TODO ES LO MISMO

  #get "articles/user/:user_id", to: "articles#from_author"   #esta ruta encuentra el autor

  resources :articles do   #tambien acepta un bloque que permite poner rutas adicionales que  no vienen en los resurces crud como "get "articles/user/:user_id", to: "articles#from_author""
    get "user/:user_id", to: "articles#from_author" , on: :collection # el collection lo que hace es que esta ruta se va a generar para una colección como artilces, si fuera on: :member seria : articles/:id/user/:user_id  | Esto ya seria via rest
  end


=begin

  get "articles/new", to: "articles#new", as: :articles_new
  post "articles", to: "articles#create"
  #get "articles/4", to: "articles#show"
  get "articles/:id", to: "articles#show"
  get "articles/:id/edit", to: "articles#edit"
  patch "/articles/:id", to: "articles#update", as: :article
  delete "/articles/:id", to: "articles#destroy"

  get "articles", to: "articles#index" # el nombre index es arbitrario pero se recomienda dejarlo como index
=end
end
