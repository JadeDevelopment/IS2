class CorreoCurriculum < ActiveRecord::Base
  belongs_to :curriculum_vitae

  validates :id, uniqueness: { scope: [:correo, :curriculum_vitae_id]}
  validates :correo, presence: { strict: true }
  validates :curriculum_vitae_id, :presence => true
end
