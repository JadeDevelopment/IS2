class Reconocimiento < ActiveRecord::Base
  belongs_to :curriculum_vitae

  validates :id, uniqueness: { scope: [:nombre_reconocimiento, :curriculum_vitae_id]}
  validates :nombre_reconocimiento, presence: { strict: true }
  validates :nombre_reconocimiento, :curriculum_vitae_id, :presence => true
end
