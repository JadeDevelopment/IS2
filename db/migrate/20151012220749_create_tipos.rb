class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.text :nombretipo

      t.timestamps 
    end
  end
end
