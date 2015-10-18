class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.integer :NumeroTema
      t.text :Tema
      t.integer :NumeroHoras
      t.text :NombrePonente
      t.date :Fecha
      t.integer :IdPonente
      t.text :Subtemas
      t.text :Bibliografia

      t.timestamps null: false
    end
  end
end
