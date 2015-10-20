class CurriculumVitaeController < ApplicationController
  def index

  end

  def new
    # CurriculumVitae.destroy_all

    @cv = CurriculumVitae.new
    @cv.delegacion = ""

    # 1.times {@cv.formacion_academica.build}
    # 1.times {@cv.reconocimiento.build}

  	@areasespecializacion = AreasEspecializacion.all #cargamos todas las areas de epecialización
  end

  def create
    @paramss = parametros_f
    puts @paramss

  	@cv = CurriculumVitae.new(parametros)  #creamos un objeto curriculum vitae a partir de los parametros requeridos
    puts @cv.to_json

    if @cv.save!  #verificamos si se puede guardar
      puts @cv.to_json

      @fa = parametros_f[:formacion_academica] #sacamos todos las formaciones academicas a partir de los parametros dados
      puts @fa.to_json

      @fa.each do |f| #multiples formaciones academicas

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

      @rec = parametros_f[:reconocimiento]  #sacamos todos los reconocimientos asociados al curriculum
      puts @rec.to_json

      @rec.each do |r| #por si hay muchos reconocimientos

        @r = Reconocimiento.new(r) #creamos un objeto a partir de los parametros requeridos
        @r.curriculum_vitae_id = @cv.id #asignamos el id del curriculum al que pertenece

        if @r.nombre_reconocimiento.blank? == false #si es valido lo guardamos
          @r.save!
        end
      end

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

      @cursos = parametros_f[:curso_de_actualizacion]
      puts @cursos.to_json
      @cursos.each do |curso|
        @curso = CursoDeActualizacion.new(curso)
        @curso.curriculum_vitae_id = @cv.id

        if @curso.nombre_curso.blank? == false
          @curso.save!
        end
      end

      @telefonos = parametros_f[:telefono_curriculum]
      puts @telefonos.to_json
      @telefonos.each do |tel|
        @tel = TelefonoCurriculum.new(tel)
        @tel.curriculum_vitae_id = @cv.id

        if @tel.valid? #si es valido lo guardamos
          @tel.save!
        end
      end

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
      redirect_to new_curriculum_vitae_path
    end

    redirect_to curriculum_vitae_index_path  #si se pudo guardar manda al index
#    puts @cv.to_json

  end

  def show
    @cv = CurriculumVitae.find(params[:id])
  end

  def edit
    @cv = CurriculumVitae.find(params[:id])
    @areasespecializacion = AreasEspecializacion.all
  end

  private
    def parametros
      params.require(:curriculum_vitae).permit(:rfc, :nombre, :appaterno, :apmaterno, :fecha_nacimiento, :numero, :calle, :colonia, :delegacion, :ciudad, :cp, :institucion, :areas_especializacion_id)
    end

    def parametros_f
      params.require(:curriculum_vitae).permit!
    end

end
