class RegistrarController < ApplicationController
	 before_action :authenticate_usuario!


    def index
      @reg = Registrar.all
      
    end

  	def show

  		#Registrar.create!(:idactividad => 12, :idinteresado => 1, :nombreactividad => 'curso de diana')
  	 @reg = Registrar.where(idinteresado: current_usuario.id)
    
     #@usuario = Usuario.find(current_usuario.id)
  		
  	end


	def new
		@reg = Registrar.new
    puts @reg.to_json
	
	end

  def destroy
    @reg = Registrar.find(params[:id])
    @reg.destroy
    redirect_to root_path
  end


	def create
    @paramss = parametros
    puts @paramss

    @reg = Registrar.new(parametros)  #creamos un objeto 'registrar' a partir de los parametros requeridos
    #@reg.idinteresado = Usuario.find(current_usuario.id)
    puts @reg.to_json
    
    if @reg.valid? #verificamos que sea valido
     @reg.save!  #guardamos
     redirect_to root_path#registrar_index_path
    end

	end

	private
    	def parametros
      		params.require(:registrar).permit(:idactividad, :nombreactividad, :idinteresado)
    	end

     def parametros_f
      params.require(:registrar).permit!
    end


end
