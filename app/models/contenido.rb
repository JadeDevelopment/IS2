class Contenido < ActiveRecord::Base
	belongs_to :actividad
	validates_uniqueness_of :numerotema

	validates :numerotema, :tema, :numerohoras, :nombreponente, :fechainicio, :fechafinal, :subtemas, :bibliografia, :presence => true
	
end
