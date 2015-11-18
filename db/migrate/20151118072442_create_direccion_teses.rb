class CreateDireccionTeses < ActiveRecord::Migration
  def change
    create_table :direccion_teses do |t|
      t.text :nombre_direccion_tesis
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
