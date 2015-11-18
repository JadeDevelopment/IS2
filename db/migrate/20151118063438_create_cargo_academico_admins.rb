class CreateCargoAcademicoAdmins < ActiveRecord::Migration
  def change
    create_table :cargo_academico_admins do |t|
      t.text :nombre_cargo_academico_admin
      t.integer :id_experiencia_academica

      t.timestamps null: false
    end
  end
end
