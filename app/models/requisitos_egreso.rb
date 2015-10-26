class RequisitosEgreso < ActiveRecord::Base
	
	belongs_to :actividad

	validates :nombrerequisitosegreso, :presence => true
end

