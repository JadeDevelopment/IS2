class CreateCursosImpartidos < ActiveRecord::Migration
  def change
    create_table :cursos_impartidos do |t|
      t.text :nombre_cursos_impartidos
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
