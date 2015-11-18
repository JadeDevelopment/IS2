class Actividad < ActiveRecord::Base

	 validates_uniqueness_of :nombre

	 validates :nombre, :descripcion, :duracionhoras, :numerosesiones, :objetivoespecifico, :objetivogeneral, :materialdidactico, :dias, :horario, :duracion, :fechainicio, :fechafinal, :cupomaximo, :cupominimo, :metas, :costogeneral, :costoalumnos, :evaluacion, :presence => true

	 has_many :contenido, dependent: :destroy
	 has_many :active_admin_comments, as: :resource
	 alias_method :comments, :active_admin_comments

	  accepts_nested_attributes_for :contenido
end
