class SessionsController < ApplicationController
  def new
    #renderiza a view
    redirect_to usuario_path(current_usuario) if usuario_signed_in?
  end

  def create
    usuario = Usuario.find_by(cpf: params[:session][:cpf]) #busca usuario pegando os param do new.html
    if usuario && usuario.authenticate(params[:session][:password])
      sign_in(usuario)
      redirect_to vacinas_path(usuario)
    else
      flash.now[:danger] = "Cpf ou Senha Inválida"
      render 'new'
    end
  end

  def destroy 
    sign_out #chama o metodo em helper
    flash[:success] = "logout bem sucedido"
    redirect_to entrar_path
  end
end
