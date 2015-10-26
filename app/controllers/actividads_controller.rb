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
  
    @actividads = Actividad.new 

    @tipo = Tipo.all
    @areas_especializacion = AreasEspecializacion.all
    @modalidad = Modalidad.all
    @area_academica = AreaAcademica.all
    @materia = Materium.all
    @disciplina = Disciplina.all
    @publico_dirigido = PublicoDirigido.all
  end

  def create

    @paramss = parametros_f
    puts @paramss

    @actividad = Actividad.new(parametros)  #creamos un objeto 'actividad' a partir de los parametros requeridos
    puts @actividad.to_json

    if @actividad.save!  #verificamos si se puede guardar
      puts @actividad.to_json

      @co = parametros_f[:contenido] #sacamos toda la info de 'contenidos'
       puts @co.to_json

      @co.each do |f| #multiples 

        @f = Contenido.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.actividad_id = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Contenido y calendarizacion no valido"
          redirect_to new_actividad_path
        end
      end
    

      @reqingreso = parametros_f[:requisitos_ingreso] #sacamos toda la info de 'requisitos_ingreso'
      puts @reqingreso.to_json
      @reqingreso.each do |f| #multiples 

        @f = RequisitosIngreso.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.idactividad = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Requisitos de ingreso no validos"
          redirect_to new_actividad_path
        end
      end

      @reqegreso = parametros_f[:requisitos_egreso] #sacamos toda la info de 'requisitos_egreso'
      puts @reqegreso.to_json
      @reqegreso.each do |f| #multiples 

        @f = RequisitosEgreso.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.idactividad = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Requisitos de egreso no validos"
          redirect_to new_actividad_path
        end
      end

      @reqperm = parametros_f[:requisitos_permanencia] #sacamos toda la info de 'requisitos_permanencia'
      puts @reqperm.to_json
      @reqperm.each do |f| #multiples 

        @f = RequisitosPermanencium.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.idactividad = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Requisitos de permanencia no validos"
          redirect_to new_actividad_path
        end
      end


    end
  end

  private
    def parametros
      params.require(:actividad).permit(:autorizado, :nombre, :nombremodulo, :descripcion, :duracionhoras, :numerosesiones, :objetivoespecifico, :objetivogeneral, :materialdidactico, :dias, :horario, :aula, :duracion, :fechainicio, :fechafinal, :cupomaximo, :cupominimo, :metas, :costogeneral, :costoalumnos, :materialesparaalumnos, :materialesdealumnos, :idcontenido, :idponente, :idtipo, :idmodalidad, :idareaacademica, :idmateria, :iddisciplina, :idpublicodirigido, :idsede, :evaluacion)
    end

    def parametros_f
      params.require(:actividad).permit!
    end
end

