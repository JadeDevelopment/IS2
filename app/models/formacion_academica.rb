class FormacionAcademica < ActiveRecord::Base
  belongs_to :curriculum_vitae

  validates_uniqueness_of :formacion_academicas_id, :scope => :area_especialidad
  validates :area_especialidad, :ultimo_grado, :año, :entidad_academica, :presence => true
end
