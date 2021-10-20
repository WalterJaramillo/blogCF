class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user   #belongs_to es un metodo de relación  | siempre donde va el belongs_to es donde va el campo adicional  y es una convención que es: colocar el nombre del modelo en minuscula en singular :user
    has_many :has_categories
    has_many :categories, through: :has_categories
    # un modelo es un clase en esta podemos utilizar getter y setter y todo lo que contiene la POO
    attr_accessor :category_elements # esto define una propiedad que nos va a permitir leer y escribir  | esto es basicamente como agregar una propiedad al objeto


    def save_categories # ahora cuando debemos llamar este metodo para guardar categorias?
        #category_elements  1,2,3   esto es un string de arreglos separados por ,
        #convertir la cadena en un arreglo 1,2,3, =>  [1,2,3]
        #categories_array = category_elements.split(',')
        #Iterar el arreglo
        return has_categories.destroy_all if category_elements.nil? || category_elements.empty?  # esto permite crear el articulo sin poner una categorias

        #has_categories.where.not(category_id: category_elements).destroy_all    # el has_categories dentro de un article me devuelve todos los recursos de la tabla asociativa que le pertencen a este articulo es una relación 1 a muchos   | where.not es el inverso de where
        category_elements.each do |category_id|
             #crear un HasCategory hasCategory<article_id:1, category_id:2>  
             #unless HasCategory.where(article:self, category:category_id).any?   # esto nos sirve para evitar guardar categorias repetidas y existe este metodo any? para las asociaciones que dice si trae algo o uno o mas da true sino false
              #  HasCategory.create(article: self, category_id: category_id) # el self es como el this de java, o el this de c# y basicamente hace referencia al articulo actual
             #end
             HasCategory.find_or_create_by(article: self, category_id: category_id)  # si hay un articulo que cumpla las 2 condiciones lo retorna si no lo crea eso previene que se creen duplicados y es mas menos codigo que la solución de arriba 
        end
       
    end
end

#rails generate model HasCategory indica 2 palabras separadas por eso el archivo se llama has_category
