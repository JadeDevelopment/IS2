class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.text :nombre_empresa
      t.integer :id_experiencia_profesional

      t.timestamps null: false
    end
  end
end
