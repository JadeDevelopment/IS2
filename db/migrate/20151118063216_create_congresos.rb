class CreateCongresos < ActiveRecord::Migration
  def change
    create_table :congresos do |t|
      t.text :nombre_congreso
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
