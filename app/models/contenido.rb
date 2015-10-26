class Contenido < ActiveRecord::Base
	belongs_to :actividad
	

	validates :numerotema, :tema, :numerohoras, :fechainicio, :fechafinal, :subtemas, :presence => true
	
end
