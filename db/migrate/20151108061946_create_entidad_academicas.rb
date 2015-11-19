class CreateEntidadAcademicas < ActiveRecord::Migration
  def change
    create_table :entidad_academicas do |t|
      t.text :nombre_entidad_academica
      t.integer :id_experiencia_profesional

      t.timestamps null: false
    end
  end
end
