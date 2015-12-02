class CreateRegistrars < ActiveRecord::Migration
  def change
    create_table :registrars do |t|
      t.integer :idactividad
      t.integer :idinteresado
      t.text :nombreactividad

      t.timestamps null: false
    end
  end
end
