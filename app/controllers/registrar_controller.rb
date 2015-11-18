class RegistrarController < ApplicationController
	 before_action :authenticate_usuario!, except: [:index]


    def index
      @reg = Registrar.all
      
    end

  	def show

  		#Registrar.create!(:idactividad => 12, :idinteresado => 1, :nombreactividad => 'curso de diana')
  	 @reg = Registrar.find(params[:id])
     @usuario = Usuario.find(current_usuario.id)
  		
  	end


	def new
		@reg = Registrar.new
	
	end


	def create
    @paramss = parametros_f
    puts @paramss

    @reg = Registrar.new(parametros)  #creamos un objeto 'registrar' a partir de los parametros requeridos
    puts @reg.to_json

	end

	private
    	def parametros
      		params.require(:registrar).permit(:idactividad, :idinteresado, :nombreactividad)
    	end

    


end
