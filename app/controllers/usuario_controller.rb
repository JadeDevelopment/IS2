class UsuarioController < ApplicationController
	before_action :authenticate_ponente!
	def show
		@usuario = Usuario.find(params[:id])
	end
end
