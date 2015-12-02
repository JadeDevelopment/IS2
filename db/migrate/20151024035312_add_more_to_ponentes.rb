class AddMoreToPonentes < ActiveRecord::Migration
  def change
    add_column :ponentes, :nombreusuario, :string
    add_index :ponentes, :nombreusuario, unique: true
    add_reference :ponentes, :curriculum_vitae, index: true, foreign_key: true
    add_column :ponentes, :salario, :decimal
  end
end
