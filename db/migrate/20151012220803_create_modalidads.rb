class CreateModalidads < ActiveRecord::Migration
  def change
    create_table :modalidads do |t|
      t.text :NombreModalidad

      t.timestamps null: false
    end
  end
end
