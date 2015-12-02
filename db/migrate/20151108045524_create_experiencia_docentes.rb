class CreateExperienciaDocentes < ActiveRecord::Migration
  def change
    create_table :experiencia_docentes do |t|
      t.text :nombre_experiencia_docente
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
