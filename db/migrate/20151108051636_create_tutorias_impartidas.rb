class CreateTutoriasImpartidas < ActiveRecord::Migration
  def change
    create_table :tutorias_impartidas do |t|
      t.text :nombre_tutorias_impartidas
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
