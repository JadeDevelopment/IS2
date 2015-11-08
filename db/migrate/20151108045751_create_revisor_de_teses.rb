class CreateRevisorDeTeses < ActiveRecord::Migration
  def change
    create_table :revisor_de_teses do |t|
      t.text :nombre_revisor_de_tesis
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
