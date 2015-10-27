class ExperienciaProfesional < ActiveRecord::Base
  belongs_to :curriculum_vitae

  validates :id, uniqueness: { scope: [:entidad, :curriculum_vitae_id]}
  validates :entidad, presence: { strict: true }

  validates :curriculum_vitae_id, :presence => true
end
