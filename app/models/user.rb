class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles # has_many es un metodo de relación | la convención de has mani es colocar el nombre del modelo en minuscular en plural
  has_one_attached :avatar   #este activeStorage sirve para imagenes, pdf, zips, documentos   | esto asocia un recurso a un identificador
end
