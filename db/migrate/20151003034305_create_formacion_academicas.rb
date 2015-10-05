class CreateFormacionAcademicas < ActiveRecord::Migration
  def change
    create_table :formacion_academicas do |t|
      t.string :area_especialidad
      t.string :ultimo_grado
      t.integer :año
      t.string :entidad_academica
      t.references :curriculum_vitae, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
