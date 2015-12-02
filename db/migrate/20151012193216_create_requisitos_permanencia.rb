class CreateRequisitosPermanencia < ActiveRecord::Migration
  def change
    create_table :requisitos_permanencia do |t|
      t.text :nombrerequisitospermanencia
      t.integer :idponente
      t.integer :idactividad

      t.timestamps 
    end
  end
end
