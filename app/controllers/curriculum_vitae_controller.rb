class CurriculumVitaeController < ApplicationController
  before_action :authenticate_ponente!
  def index

  end

  def new
    if current_ponente.curriculum_vitae_id
      @ponente = Ponente.find(current_ponente.id)
      redirect_to @ponente
    end

    @cv = CurriculumVitae.new
    @cv.delegacion = ""

    # 1.times {@cv.formacion_academica.build}
    # 1.times {@cv.reconocimiento.build}

  	@areasespecializacion = AreasEspecializacion.all #cargamos todas las areas de epecialización
  end

  #iniciamos el create
  def create
    @paramss = parametros_f
    puts @paramss
    @poenten = Ponente.find(current_ponente.id)

  	@cv = CurriculumVitae.new(parametros)  #creamos un objeto curriculum vitae a partir de los parametros requeridos
    puts @cv.to_json
    @cv.save!
    rescue ActiveRecord::RecordInvalid    


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
      #fin multiples formaciones academicas

      #multiples reconocimientos
      @rec = parametros_f[:reconocimiento]  #sacamos todos los reconocimientos asociados al curriculum
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
      @cursos.each do |curso|
        @curso = CursoDeActualizacion.new(curso)
        @curso.curriculum_vitae_id = @cv.id

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

      @expprofs = parametros_f[:experiencia_profesional]
      @expprofs.each do |exp|
        @exp = ExperienciaProfesional.new(exp)
        @exp.curriculum_vitae_id = @cv.id

        if @exp.valid?
          @exp.save!
        end
      end
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

  def edit#edit
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
end



  private
    def parametros
      params.require(:curriculum_vitae).permit(:rfc, :nombre, :appaterno, :apmaterno, :fecha_nacimiento, :numero, :calle, :colonia, :delegacion, :ciudad, :cp, :institucion, :areas_especializacion_id)
    end

    def parametros_f
      params.require(:curriculum_vitae).permit!
    end
end
