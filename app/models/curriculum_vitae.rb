class CurriculumVitae < ActiveRecord::Base
  belongs_to :areas_especializacion, touch: true
  
  validates_uniqueness_of :rfc
  validates :rfc, :nombre, :apmaterno, :appaterno, :fecha_nacimiento, :numero, :calle, :colonia, :ciudad, :cp, :institucion, :areas_especializacion_id, :presence => true

  has_many :formacion_academica, dependent: :destroy
  has_many :reconocimiento, dependent: :destroy

  has_many :curso_de_actualizacion, through: :formacion_academica

  accepts_nested_attributes_for :formacion_academica
  accepts_nested_attributes_for :reconocimiento
  accepts_nested_attributes_for :curso_de_actualizacion
end
