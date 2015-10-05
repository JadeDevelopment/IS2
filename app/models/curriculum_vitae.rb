class CurriculumVitae < ActiveRecord::Base
  belongs_to :areas_especializacion
  validates_uniqueness_of :curriculum_vitaes_id, :scope => :rfc
  validates :rfc, :nombre, :apmaterno, :appaterno, :fecha_nacimiento, :numero, :calle, :colonia, :ciudad, :cp, :institucion, :areas_especializacion_id, :presence => true

  has_many :formacion_academica, dependent: :destroy
  accepts_nested_attributes_for :formacion_academica
end
