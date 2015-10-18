class Reconocimiento < ActiveRecord::Base
  belongs_to :curriculum_vitae

  validates :nombre_reconocimiento, uniqueness: true, allow_blank: false
  validates :nombre_reconocimiento, :curriculum_vitae_id, :presence => true
end
