class CursoDeActualizacion < ActiveRecord::Base
  belongs_to :curriculum_vitae

  validates :id, uniqueness: { scope: [:nombre_curso, :curriculum_vitae_id]}
  validates :nombre_curso, presence: { strict: true }
  validates :curriculum_vitae_id, :presence => true
end
