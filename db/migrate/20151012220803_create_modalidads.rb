class CreateModalidads < ActiveRecord::Migration
  def change
    create_table :modalidads do |t|
      t.text :nombremodalidad

      t.timestamps 
    end
  end
end
