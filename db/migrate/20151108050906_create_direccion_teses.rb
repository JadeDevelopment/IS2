class CreateDireccionTeses < ActiveRecord::Migration
  def change
    create_table :direccion_teses do |t|
      t.text :nombre_cursos_impartidos
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
