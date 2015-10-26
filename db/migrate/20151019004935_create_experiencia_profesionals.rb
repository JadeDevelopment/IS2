class CreateExperienciaProfesionals < ActiveRecord::Migration
  def change
    create_table :experiencia_profesionals do |t|
      t.string :entidad
      t.text :experiencia
      t.references :curriculum_vitae, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
