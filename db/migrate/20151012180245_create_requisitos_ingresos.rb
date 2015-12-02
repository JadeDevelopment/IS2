class CreateRequisitosIngresos < ActiveRecord::Migration
  def change
    create_table :requisitos_ingresos do |t|
      t.text :nombrerequisitosingreso
      t.integer :idponente
      t.string :idactividad
      t.string :integer

      t.timestamps 
    end
  end
end
