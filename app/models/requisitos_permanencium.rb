class RequisitosPermanencium < ActiveRecord::Base
	belongs_to :actividad

	validates :nombrerequisitospermanencia, :presence => true
end
