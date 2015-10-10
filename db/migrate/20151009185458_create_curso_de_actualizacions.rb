class CreateCursoDeActualizacions < ActiveRecord::Migration
  def change
    create_table :curso_de_actualizacions do |t|
      t.string :nombre_curso
      t.references :formacion_academica, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
