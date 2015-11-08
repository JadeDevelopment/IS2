class CreateSedes < ActiveRecord::Migration
  def change
    create_table :sedes do |t|
      t.text :nombresede

      t.timestamps 
    end
  end
end
