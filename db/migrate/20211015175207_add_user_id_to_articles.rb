class AddUserIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, null: false, foreign_key: true, default: 1 # un articulo no puede estar si un user no lo ha creado por eso esl null:false, pero todo esto es dependiendo
  end
end
