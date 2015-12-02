class CreateExperienciaAcademicas < ActiveRecord::Migration
  def change
    create_table :experiencia_academicas do |t|
      t.integer :id_curriculum_vitae

      t.timestamps null: false
    end
  end
end
