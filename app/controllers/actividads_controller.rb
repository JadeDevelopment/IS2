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

  Tipo.create!(:nombretipo => 'Curso')
    Tipo.create!(:nombretipo => 'Diplomado')
    Tipo.create!(:nombretipo => 'Curso Diplomado')
    Tipo.create!(:nombretipo => 'Coloquio')
    Tipo.create!(:nombretipo => 'Taller')
    Tipo.create!(:nombretipo => 'Jornada')
    Tipo.create!(:nombretipo => 'Seminario')

    AreasEspecializacion.create!(:area => 'Matemáticas')
    AreasEspecializacion.create!(:area => 'Física')
    AreasEspecializacion.create!(:area => 'Biologia')
    AreasEspecializacion.create!(:area => 'Computación')

    Modalidad.create!(:nombremodalidad => 'Presencial')
    Modalidad.create!(:nombremodalidad => 'Semi Presencial')
    Modalidad.create!(:nombremodalidad => 'En linea')

     AreaAcademica.create!(:nombrearea => 'Ciencias Fisico-Matemáticas')
     AreaAcademica.create!(:nombrearea => 'Ciencias Biológicas, Químicas y de la Salud')
     AreaAcademica.create!(:nombrearea => 'Ciencias Sociales')
     AreaAcademica.create!(:nombrearea => 'Humanidades y de las Artes')
     AreaAcademica.create!(:nombrearea => 'Formación Pedagógica')

     Materium.create!(:nombremateria => 'Biología')
     Materium.create!(:nombremateria => 'Física')
     Materium.create!(:nombremateria => 'Matemáticas')
     Materium.create!(:nombremateria => 'Actuaría')


     Disciplina.create!(:nombredisciplina => 'Analisis Biogeográfico')
     Disciplina.create!(:nombredisciplina => 'Arácnidos de México (Biología)')
     Disciplina.create!(:nombredisciplina => 'Bioestadística')
     Disciplina.create!(:nombredisciplina => 'Ciencias Naturales')
     Disciplina.create!(:nombredisciplina => 'Cómputo')
     Disciplina.create!(:nombredisciplina => 'Dibujo de la Naturaleza (Ilustración)')
     Disciplina.create!(:nombredisciplina => 'Fauna Silvestre')
     Disciplina.create!(:nombredisciplina => 'Genética Forense')
     Disciplina.create!(:nombredisciplina => 'Gestión de Fondos y Administración de Proyectos')
     Disciplina.create!(:nombredisciplina => 'Herramientas en AVE')
     Disciplina.create!(:nombredisciplina => 'Impacto Ambiental')
     Disciplina.create!(:nombredisciplina => 'Informática')
     Disciplina.create!(:nombredisciplina => 'Latex y Knitr')
     Disciplina.create!(:nombredisciplina => 'Matemáticas')
     Disciplina.create!(:nombredisciplina => 'Metodología Lean-Agile')
     Disciplina.create!(:nombredisciplina => 'Solvencia II')

     PublicoDirigido.create!(:nombrepublico => 'Alumnos')
     PublicoDirigido.create!(:nombrepublico => 'Profesores')
     PublicoDirigido.create!(:nombrepublico => 'Iniciativa Privada')
     PublicoDirigido.create!(:nombrepublico => 'Sector público')

     
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
    @actividads = Actividad.new(params[:actividad])
  end


end
