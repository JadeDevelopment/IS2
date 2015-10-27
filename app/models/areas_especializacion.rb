class AreasEspecializacion < ActiveRecord::Base
  validates_uniqueness_of :area
end
