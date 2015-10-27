class CreateCorreoCurriculums < ActiveRecord::Migration
  def change
    create_table :correo_curriculums do |t|
      t.string :correo
      t.string :publicacion, :default => 't'
      t.references :curriculum_vitae, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
