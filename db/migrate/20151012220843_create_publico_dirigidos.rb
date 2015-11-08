class CreatePublicoDirigidos < ActiveRecord::Migration
  def change
    create_table :publico_dirigidos do |t|
      t.text :nombrepublico

      t.timestamps 
    end
  end
end
