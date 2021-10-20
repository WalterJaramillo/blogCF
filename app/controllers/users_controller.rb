class UsersController < ApplicationController
  before_action :authenticate_user!   ## solo llegare aqui si el usuario a iniciado sesión
  def edit 

  end


  def update
    current_user.update(user_params)
    redirect_back(fallback_location: root_path)   #Redirecciona para atras para la pagina de la que venia  | fallback_location se ira a la pagina root si no hay una pagina a la que ir antes
  end


  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
