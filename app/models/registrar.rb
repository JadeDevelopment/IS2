class Registrar < ActiveRecord::Base

validates :idactividad, :idinteresado, :nombreactividad, :presence => true

end
