class CreateRequisitosEgresos < ActiveRecord::Migration
  def change
    create_table :requisitos_egresos do |t|
      t.text :nombrerequisitosegreso
      t.integer :idponente
      t.integer :idactividad

      t.timestamps 
    end
  end
end
