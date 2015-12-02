class CreateAreasEspecializacions < ActiveRecord::Migration
  def change
    create_table :areas_especializacions do |t|
      t.string :area

      t.timestamps 
    end
  end
end
