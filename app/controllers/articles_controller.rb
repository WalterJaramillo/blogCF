class ArticlesController < ApplicationController
    # CRUD => Crear, Leer, Actualizar,Eliminar
    #before_action :find_article, only: [:show,:edit,:update,:destroy]
    before_action :find_article, except: [:new,:create,:index,:from_author]
    before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy] # show e index no necesitan estar logueados
    #after_action :method     se ve menos 

    def index
        @articles = Article.all
    end
    
    def new
        @article = Article.new
        #@article.title = "algo"      esta variable la envio a la vista new, como title tiene algo lo pinta en la vista
    end

    

    def create   #create recibe el formulario de new con sus parametros nuevos y lo crea
        #Article.create(title: 'mi primer articulo')
        #@article = Article.create(title: params[:article][:title],           #create es un metodo de clase
                                  #content: params[:article][:content])
                                  #user:  current_user)    #esto hace referencia automaticamente al usuario que inicio sesión y sabemos que es seguro por que ya debe haber un usurio logueado y asi se guardara solo una vez en db
        #@article.user = current.user # esta podria se una forma de guardar el id del usuario que hace el articulo pero se estaria creando el articulo 2 veces
        #@article.save
        @article = current_user.articles.create(title: params[:article][:title],           #esto creara un articulo para el usuario creado, entonces ya no tendremos que asignar la propiedad user_id, sino que rails la va asignar por si mismo
                                    content: params[:article][:content])
        #render json: @article

        redirect_to @article  #despues de crearlo lo envia la vista show ya no en json
    end

    def show
        #@article = Article.find(params[:id])
    end

    def edit           #edit y new muestran el mismo formulario y no guardan son parecidos e las vistas
        #@article = Article.new    objeto vacio
        #puts "\n\n\n #{@article.id} \n\n\n"
        #puts "\n\n\n #{@article.persisted?} \n\n\n"    esto muestra falso que significa que no esta en la db
        #@article = Article.find(params[:id])    #objeto lleno cuando le paso un parametro ejempo /articles/2
        #puts "\n\n\n #{@article.persisted?} \n\n\n"  #true
    end

    def update   #update recibie el formulario de edit con sus parametros para actualizar y lo actualiza  | update y create son muy parecidos, la unica diferencia es que utiliza el metodo update
        #@article = Article.find(params[:id])                                #update es un metodo de objeto
        @article.update(title: params[:article][:title],      
                        content: params[:article][:content])
        render json: @article
    end

    def destroy
        #@article = Article.find(params[:id])
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        #puts "estoy en find article"
        @article = Article.find(params[:id])
    end
end
