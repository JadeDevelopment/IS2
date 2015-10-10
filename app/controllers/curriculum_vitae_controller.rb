class CurriculumVitaeController < ApplicationController
  def index

  end

  def new
    # CurriculumVitae.destroy_all
    @cv = CurriculumVitae.new
    @cv.delegacion = ""
    # 1.times {@cv.formacion_academica.build}
    # 1.times {@cv.reconocimiento.build}
  	@areasespecializacion = AreasEspecializacion.all
  end

  def create
  	@cv = CurriculumVitae.new(parametros)
    puts @cv.to_json
    if @cv.save!
      puts @cv.to_json
      @fa = parametros_f[:formacion_academica]
      puts @fa.to_json
      @fa.each do |f|
        @f = FormacionAcademica.new(f)
        @f.curriculum_vitae_id = @cv.id
        if @f.valid?
          @f.save!
        else
          @cv.destroy
          flash[:notice] = "Formacion Academica no valido"
          redirect_to new_curriculum_vitae_path
        end
      end   
      @rec = parametros_f[:reconocimiento]
      puts @rec.to_json
      @rec.each do |r|
        @r = Reconocimiento.new(r)
        @r.curriculum_vitae_id = @cv.id
        if @r.valid?
          @r.save!
        else
          @cv.destroy
          flash[:notice] = "Reconocimiento no valido"
          redirect_to new_curriculum_vitae_path
        end
      end
    else
      flash[:notice] = "Curriculum no valido"
      redirect_to new_curriculum_vitae_path
    end

    redirect_to curriculum_vitae_index
#    puts @cv.to_json

  end

  def show

  end

  private
    def parametros
      params.require(:curriculum_vitae).permit(:rfc, :nombre, :appaterno, :apmaterno, :fecha_nacimiento, :numero, :calle, :colonia, :delegacion, :ciudad, :cp, :institucion, :areas_especializacion_id, :formacion_academica)
    end

    def parametros_f
      params.require(:curriculum_vitae).permit!
    end


  #Actualiza el CV:
  def updateCurriculumVitae
      @post = CurriculumVitae.find(params[:id])

      if @post.update_attributes(params.require(:curriculum_vitae).permit(:rfc, :nombre, :appaterno, :apmaterno, :fecha_nacimiento, :numero, :calle, :colonia, :delegacion, :ciudad, :cp, :institucion, :areas_especializacion_id, :formacion_academica)) 
         redirect_to :action => :show, :id => @curriculum_vitae.id
      else
        return
      end
  end

end
