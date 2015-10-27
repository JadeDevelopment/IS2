class CreateCursoDeActualizacions < ActiveRecord::Migration
  def change
    create_table :curso_de_actualizacions do |t|
      t.string :nombre_curso
      t.integer :año
      t.references :curriculum_vitae, index: true, foreign_key: true

      t.timestamps 
    end
  end
end
