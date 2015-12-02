class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.integer :numerotema
      t.text :tema
      t.integer :numerohoras
      t.text :nombreponente
      t.date :fechainicio
      t.date :fechafinal
      t.text :subtemas
      t.text :bibliografia

      t.timestamps null: false
    end
  end
end
