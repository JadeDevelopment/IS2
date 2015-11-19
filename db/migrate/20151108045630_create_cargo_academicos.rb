class CreateCargoAcademicos < ActiveRecord::Migration
  def change
    create_table :cargo_academicos do |t|
      t.text :nombre_cargo_academico
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
