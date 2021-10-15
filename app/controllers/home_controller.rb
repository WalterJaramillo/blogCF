class HomeController < ApplicationController
  before_action :authenticate_user!  #este metod hace que redireccinoa a la autenticacion si no esta logueado si esta logueado lo pasa al metodo index abajo y este metodo se puede usar en cualquier parte
  def index
  end
end
