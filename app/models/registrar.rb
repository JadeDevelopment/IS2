class Registrar < ActiveRecord::Base

validates :idactividad, :nombreactividad, :idinteresado, :presence => true

end
