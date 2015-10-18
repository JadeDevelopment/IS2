class CreatePublicoDirigidos < ActiveRecord::Migration
  def change
    create_table :publico_dirigidos do |t|
      t.text :NombrePublico

      t.timestamps null: false
    end
  end
end
