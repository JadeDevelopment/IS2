class CreatePublicaciones < ActiveRecord::Migration
  def change
    create_table :publicaciones do |t|
      t.text :nombre_publicaciones
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
