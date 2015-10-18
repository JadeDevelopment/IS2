class CreateRequisitosIngresos < ActiveRecord::Migration
  def change
    create_table :requisitos_ingresos do |t|
      t.text :NombreRequisitosIngreso
      t.integer :IdPonente
      t.string :IdActividad
      t.string :integer

      t.timestamps null: false
    end
  end
end
