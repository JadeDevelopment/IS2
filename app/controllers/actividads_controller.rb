class ActividadsController < ApplicationController



  def show
    
  	#Actividad.create!(:autorizado => 0, :nombre => 'Taller de Lobos', :nombremodulo => 'Modulo?', :descripcion => 'Taller para aprender sobre ranas de México', 
  	#	:duracionhoras => 200, :numerosesiones => 3, :objetivoespecifico => 'Saber cuales ranas son venenosas', 
  	#	:objetivogeneral => 'Aprender sobre ranas venenosas', :materialdidactico => 'N/A', :dias => 'Lunes, Miercoles, Viernes',
  	#	 :horario => '9:00 hrs - 18:00 hrs', :aula => 'Tlahuizcalpan', :duracion => '3sesiones', :fechainicio => '01-01-2015', :fechafinal => '01-01-2015', 
  	#	 :cupomaximo => 10, :cupominimo => 5, :metas => 'Metas', :costogeneral => 4005.5, :costoalumnos => 229.2, :materialesparaalumnos => 'Recipientes', 
  	#	 :materialesdealumnos => 'Bata', :idcontenido => 1, :idponente => 1, :idtipo => 1, :idmodalidad => 1, :idareaacademica => 1, :idmateria => 1, :iddisciplina => 1, :idpublicodirigido => 1, :idsede => 1, :evaluacion => 'Examenes')
  	@actividad = Actividad.find(params[:id])


  end

  def showSolicitud
      @actividad = Actividad.find(params[:id])    
  end

def index
  @actividads = Actividad.all
end

  def new
    # CurriculumVitae.destroy_all
    @actividads = Actividad.new 
 
  end

  def create
    @actividads = Actividad.new(params[:actividad])
  end


end
