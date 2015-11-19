class CreatePonencia < ActiveRecord::Migration
  def change
    create_table :ponencia do |t|
      t.text :nombre_ponencias
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
