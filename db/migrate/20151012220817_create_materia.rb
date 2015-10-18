class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materia do |t|
      t.text :NombreMateria

      t.timestamps null: false
    end
  end
end
