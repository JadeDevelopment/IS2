class ExperienciaProfesional < ActiveRecord::Base
  belongs_to :curriculum_vitae

  has_many :entidad_academica
  has_many :empresa


  validates :curriculum_vitae_id, :presence => true
end
