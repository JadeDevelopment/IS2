class Actividad < ActiveRecord::Base
	 validates_uniqueness_of :nombre
end
