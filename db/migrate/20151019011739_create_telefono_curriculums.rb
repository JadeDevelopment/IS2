class CreateTelefonoCurriculums < ActiveRecord::Migration
  def change
    create_table :telefono_curriculums do |t|
      t.string :num_telefono
      t.references :curriculum_vitae, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
