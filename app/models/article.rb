class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user   #belongs_to es un metodo de relación  | siempre donde va el belongs_to es donde va el campo adicional  y es una convención que es: colocar el nombre del modelo en minuscula en singular :user
end
