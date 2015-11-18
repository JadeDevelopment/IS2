class CursoDeActualizacion < ActiveRecord::Base
  belongs_to :curriculum_vitae


  validates :nombre_curso, :año, :formacion_academica_id, :presence => true
end
