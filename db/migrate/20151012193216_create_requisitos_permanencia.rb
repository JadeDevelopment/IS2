class CreateRequisitosPermanencia < ActiveRecord::Migration
  def change
    create_table :requisitos_permanencia do |t|
      t.text :NombreRequisitosPermanencia
      t.integer :IdPonente
      t.integer :IdActividad

      t.timestamps 
    end
  end
end
