class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.text :NombreDisciplina

      t.timestamps 
    end
  end
end
