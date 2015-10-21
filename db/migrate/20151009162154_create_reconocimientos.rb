class CreateReconocimientos < ActiveRecord::Migration
  def change
    create_table :reconocimientos do |t|
      t.string :nombre_reconocimiento
      t.references :curriculum_vitae, index: true, foreign_key: true

      t.timestamps 
    end
  end
end
