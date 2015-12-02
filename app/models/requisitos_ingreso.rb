class RequisitosIngreso < ActiveRecord::Base
	belongs_to :actividad

	validates :nombrerequisitosingreso, :presence => true
end
