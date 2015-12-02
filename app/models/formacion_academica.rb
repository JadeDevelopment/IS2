class FormacionAcademica < ActiveRecord::Base
  belongs_to :curriculum_vitae

  has_many :curso_de_actualizacion

  validates :id, uniqueness: { scope: [:area_especialidad, :curriculum_vitae_id]}
  validates :area_especialidad, :ultimo_grado, :año, :entidad_academica, :presence => true

  accepts_nested_attributes_for :curso_de_actualizacion
end
