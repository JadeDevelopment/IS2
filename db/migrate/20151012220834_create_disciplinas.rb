class CreateDisciplinas < ActiveRecord::Migration
  def change
    create_table :disciplinas do |t|
      t.text :nombredisciplina

      t.timestamps 
    end
  end
end
