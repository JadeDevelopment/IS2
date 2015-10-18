class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.text :NombreDisciplina

      t.timestamps null: false
    end
  end
end
