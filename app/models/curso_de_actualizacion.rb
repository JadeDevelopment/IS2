class CursoDeActualizacion < ActiveRecord::Base
  belongs_to :formacion_academica

  validates :id, uniqueness: { scope: [:nombre_curso, :formacion_academica_id]}
end
