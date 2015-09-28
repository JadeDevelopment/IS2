class AreasEspecializacionController < ApplicationController
  def index
  end

  def new
  end

  def create
  	render plain: params[:areas_especializacion].inspect
  end

  def destroy
  end
end
