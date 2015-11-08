class CreateAsesoriasImpartidas < ActiveRecord::Migration
  def change
    create_table :asesorias_impartidas do |t|
      t.text :nombre_asesorias_impartidas
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
