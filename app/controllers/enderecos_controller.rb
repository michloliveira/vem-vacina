class EnderecosController < ApplicationController
    before_action :require_logged_in_user
    before_action :set_endereco, only: %i[ show edit ]

    def new
        @endereco = Endereco.new
        if current_usuario.endereco == nil
            flash.alert =  "Você deve criar um endereço para prosseguir."
          end
    end


    def create
        @endereco = Endereco.new(endereco_params)
        @endereco.usuario_id = current_usuario.id

        if @endereco.save
            flash[:success] = "Cadastrado com sucesso"
            redirect_to usuario_path(current_usuario)
        else
            render 'root'
        end
    end


    private
        def set_endereco
            @endereco = current_usuario.endereco
        end

        def endereco_params
            params.require(:endereco).permit(:cep, :cidade, :bairro, :logradouro, :complemento)
        end
end
