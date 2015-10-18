class CreateRequisitosEgresos < ActiveRecord::Migration
  def change
    create_table :requisitos_egresos do |t|
      t.text :NombreRequisitosEgreso
      t.integer :IdPonente
      t.integer :IdActividad

      t.timestamps null: false
    end
  end
end
