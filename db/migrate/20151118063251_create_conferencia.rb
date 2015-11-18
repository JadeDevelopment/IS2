class CreateConferencia < ActiveRecord::Migration
  def change
    create_table :conferencia do |t|
      t.text :nombre_conferencia
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
