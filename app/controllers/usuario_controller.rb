class UsuarioController < ApplicationController
	before_action :authenticate_usuario!
	def show
		@usuario = Usuario.find(params[:id])
	end
end
