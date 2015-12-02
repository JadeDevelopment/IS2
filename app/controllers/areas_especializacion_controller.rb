class AreasEspecializacionController < ApplicationController


#Actualiza el Area de esp:
def updateAreasEspecializacion
    @post = AreasEspecializacion.find(params[:id])

    if @post.update_attributes(params.require(:areas_especializacion).permit(:Area)) 
       redirect_to :action => :show, :id => @areas_especializacion.id
    else
       return
    end
end

end
