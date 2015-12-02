class CurriculumVitaeController < ApplicationController
  before_action :authenticate_ponente!
  def index
    if current_ponente.curriculum_vitae_id
      @ponente = Ponente.find(current_ponente.id)
      redirect_to @ponente
    end
  end

  def new
    if current_ponente.curriculum_vitae_id
      @ponente = Ponente.find(current_ponente.id)
      redirect_to @ponente
    end

    @cv = CurriculumVitae.new
    @cv.delegacion = ""

  	@areasespecializacion = AreasEspecializacion.all #cargamos todas las areas de epecialización
  end

  #iniciamos el create
  def create
    @paramss = parametros_f
    puts @paramss
    @poenten = Ponente.find(current_ponente.id)
    
  	@cv = CurriculumVitae.new(parametros)  #creamos un objeto curriculum vitae a partir de los parametros requeridos
    puts @cv.to_json

    #verificamos si se puede guardar
    if @cv.save  
      puts @cv.to_json

      @poenten.update(curriculum_vitae_id: @cv.id)

    

      #multiples formaciones academicas
      @fa = parametros_f[:formacion_academica]
      puts @fa.to_json

      @fa.each do |f| 

        @f = FormacionAcademica.new(f)  #creamos formaciones academicas a partir de los parametros requeridos
        @f.curriculum_vitae_id = @cv.id #le asignamos el id del curriculum al que pertenece
        

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @cv.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Formacion Academica no valido"
          redirect_to new_curriculum_vitae_path
        end
      end  
      #fin multiples formaciones academic.formacion_academica_idas

      #multiples reconocimientos
      @rec = parametros_f[:reconocimientos]  #sacamos todos los reconocimientos asociados al curriculum
      puts @rec.to_json

      @rec.each do |r|

        @r = Reconocimiento.new(r) #creamos un objeto a partir de los parametros requeridos
        @r.curriculum_vitae_id = @cv.id #asignamos el id del curriculum al que pertenece

        if @r.nombre_reconocimiento.blank? == false #si es valido lo guardamos
          @r.save!
        end
      end
      #fin multiples reconocimientos

      #multiples correos
      @correos= parametros_f[:correo_curriculum]
      @correos.each do |cor|
        begin
          @cor = CorreoCurriculum.new(cor)
        rescue ActiveRecord::CatchAll
          #Only comes in here if nothing else catches the error
          @cor = CurriculumVitae.build
        end
        @cor.curriculum_vitae_id = @cv.id #asignamos el id del curriculum al que pertenece
        if @cor.valid? #si es valido lo guardamos
          @cor.save!
        else
          @cv.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Formacion Academica no valido"
          redirect_to new_curriculum_vitae_path
        end
      end
      #fin multiples correos

      

      #multiples cursos de actualizacion
      @cursos = parametros_f[:curso_de_actualizacion]
      puts @cursos.to_json
      @formacion_academica = FormacionAcademica.find_by curriculum_vitae_id: @cv.id
      
      @cursos.each do |curso|
        @curso = CursoDeActualizacion.new(curso)
        @curso.formacion_academica_id = @formacion_academica.id


        if @curso.nombre_curso.blank? == false
          @curso.save!
        end
      end
      #fin multiples cursos de actualizacion


      #fin multiples telefonos
      @telefonos = parametros_f[:telefono_curriculum]
      puts @telefonos.to_json
      @telefonos.each do |tel|
        @tel = TelefonoCurriculum.new(tel)
        @tel.curriculum_vitae_id = @cv.id

        if @tel.valid? #si es valido lo guardamos
          @tel.save!
        end
      end
      #fin multiples telefonos

     #Asignamos el valor del id de cv para la tabla 'ExperienciaProfesional'
      @exp = ExperienciaProfesional.new
      @exp.curriculum_vitae_id = @cv.id
      if @exp.valid? #si es valido lo guardamos
          @exp.save!
      end

      

      #multiples entidades academicas
      @entidad_academica = parametros_f[:entidad_academica]
      puts @entidad_academica.to_json
      @experiencia_profesional = ExperienciaProfesional.find_by_sql ["SELECT * FROM experiencia_profesionals WHERE curriculum_vitae_id = ?;",@cv.id]
     
      
      @entidad_academica.each do |r|
        @r = EntidadAcademica.new(r)
        @r.id_experiencia_profesional = @experiencia_profesional[0].id

        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples entidades academicas


      #multiples empresas
      @empresa = parametros_f[:empresa]
      puts @empresa.to_json
      @experiencia_profesional = ExperienciaProfesional.find_by_sql ["SELECT * FROM experiencia_profesionals WHERE curriculum_vitae_id = ?;",@cv.id]
     
      
      @empresa.each do |r|
        @r = Empresa.new(r)
        @r.id_experiencia_profesional = @experiencia_profesional[0].id

        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples empresas


      #Asignamos el valor del id de cv para la tabla 'ExperienciaAcademica'
    
      @f = ExperienciaAcademica.new(params[@cv.id])  #creamos experiencias academicas 
      @f.id_curriculum_vitae = @cv.id #le asignamos el id del curriculum al que pertenece
       
      if @f.valid? #verificamos que sea valido
        @f.save!  #guardamos      
      end  
     


      #multiples experiencias docentes
      @experiencia_docente = parametros_f[:experiencia_docente]
      puts @experiencia_docente.to_json
      
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      puts @experiencia_academica.to_json


      @experiencia_docente.each do |r|
        @r = ExperienciaDocente.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        puts @r.to_json
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples experiencias docentes

      #multiples cargos academicos
      @cargo_academico = parametros_f[:cargo_academico]
      puts @cargo_academico.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
            
      @cargo_academico.each do |r|
        @r = CargoAcademico.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples cargos academicos


      #multiples cargos academicos admin
      @cargo_academico_admin = parametros_f[:cargo_academico_admin]
      puts @cargo_academico_admin.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
           
      @cargo_academico_admin.each do |r|
        @r = CargoAcademicoAdmin.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples cargos academicos admin


      #multiples revisor de tesis
      @revisor_de_tesis = parametros_f[:revisor_de_teses]
      puts @revisor_de_tesis.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @revisor_de_tesis.each do |r|
        @r = RevisorDeTesis.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples revisor de tesis


      #multiples publicaciones
      @publicaciones = parametros_f[:publicaciones]
      puts @publicaciones.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @publicaciones.each do |r|
        @r = Publicacione.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples publicaciones


      #multiples ponencias
      @ponencia = parametros_f[:ponencia]
      puts @ponencia.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @ponencia.each do |r|
        @r = Ponencia.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples ponencias

      #multiples conferencias
      @conferencia = parametros_f[:conferencia]
      puts @conferencia.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @conferencia.each do |r|
        @r = Conferencium.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples conferencias


      #multiples congresos
      @congreso = parametros_f[:congreso]
      puts @congreso.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @congreso.each do |r|
        @r = Congreso.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples congresos


      #multiples cursos impartidos
      @cursos_impartidos = parametros_f[:cursos_impartidos]
      puts @cursos_impartidos.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @cursos_impartidos.each do |r|
        @r = CursosImpartido.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples cursos impartidos


      #multiples direccion tesis
      @direccion_tesis = parametros_f[:direccion_teses]
      puts @direccion_tesis.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @direccion_tesis.each do |r|
        @r = DireccionTesis.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples direccion tesis

      #multiples asesorias impartidas
      @asesorias_impartidas = parametros_f[:asesorias_impartidas]
      puts @asesorias_impartidas.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @asesorias_impartidas.each do |r|
        @r = AsesoriasImpartida.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples asesorias impartidas

      #multiples tutorias impartidas
      @tutorias_impartidas = parametros_f[:tutorias_impartidas]
      puts @tutorias_impartidas.to_json
      @experiencia_academica = ExperienciaAcademica.find_by_sql ["SELECT * FROM experiencia_academicas WHERE id_curriculum_vitae = ?;",@cv.id]
      
      @tutorias_impartidas.each do |r|
        @r = TutoriasImpartida.new(r)
        @r.id_experiencia_academica = @experiencia_academica[0].id
        if @r.valid? #si es valido lo guardamos
          @r.save!
        end
      end
      #FIN multiples tutorias impartidas

    else #si ya existe regresa a la pagina anterior
      flash[:notice] = "Curriculum no valido"
      render template: "curriculum_vitae/new" and return
    end
    redirect_to  @poenten#si se pudo guardar manda al index
  end

  def show
    begin
      @cv = CurriculumVitae.find(params[:id])
    rescue
      @cv = Ponente.find(current_ponente.curriculum_vitae_id)
    end
    
    unless @cv.id == current_ponente.curriculum_vitae_id
      redirect_to :back, :alert => "No puedes acceder."
    end
  end

  def edit
    begin
      @cv = CurriculumVitae.find(params[:id])
    rescue
      @cv = Ponente.find(current_ponente.curriculum_vitae_id)
    end
    
    unless @cv.id == current_ponente.curriculum_vitae_id
      redirect_to :back, :alert => "No puedes acceder."
    end
    @areasespecializacion = AreasEspecializacion.all
  end

def update
  @cv = CurriculumVitae.find(params[:id])
  #@cv.update()
  #redirect_to @cv
  if @cv.update_attributes(parametros)
    @cor = parametros_f[:correo_curriculum]
    puts @cor.to_json
    @cor.each do |c|
      puts c.to_json
      @correoc = CorreoCurriculum.find(c[0])
      @correoc.update(correo: c[1][:correo])
    end
    redirect_to :action => :show, :id => @cv.id
  else
    render 'edit'
  end
end



  private
    def parametros
      params.require(:curriculum_vitae).permit(:rfc, :nombre, :appaterno, :apmaterno, :fecha_nacimiento, :numero, :calle, :colonia, :delegacion, :ciudad, :cp, :institucion, :areas_especializacion_id)
    end

    def parametros_f#hay metodos que permiten mandar hash de listas, e.d. debe recibir una lista
      params.require(:curriculum_vitae).permit!
    end
end
