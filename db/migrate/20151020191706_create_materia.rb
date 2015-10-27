class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materia do |t|
      t.text :nombremateria

      t.timestamps null: false
    end
  end
end
