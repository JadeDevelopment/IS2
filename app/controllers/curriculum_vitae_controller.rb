class CurriculumVitaeController < ApplicationController
  def index

  end

  def new
    @cv = CurriculumVitae.new
    1.times { @cv.formacion_academica.build}
  	@areasespecializacion = AreasEspecializacion.all
  end

  def create
  	render plain: params[:curriculum_vitae].inspect
  end

  def show
  end
end
