class Reconocimiento < ActiveRecord::Base
  belongs_to :curriculum_vitae

  validates :nombre_reconocimiento, uniqueness: true
end
