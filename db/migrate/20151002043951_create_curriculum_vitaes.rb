class CreateCurriculumVitaes < ActiveRecord::Migration
  def change
    create_table :curriculum_vitaes do |t|
      t.string :rfc
      t.string :nombre
      t.string :apmaterno
      t.string :appaterno
      t.date :fecha_nacimiento
      t.integer :numero
      t.string :calle
      t.string :colonia
      t.string :delegacion, :default => '?'                                     
      t.string :ciudad
      t.integer :cp
      t.string :institucion
      t.references :areas_especializacion, index: true, foreign_key: true

      t.timestamps null: false
    end

    
  end
end
