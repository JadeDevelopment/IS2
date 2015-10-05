class CreateAreasEspecializacions < ActiveRecord::Migration
  def change
    create_table :areas_especializacions do |t|
      t.string :area

      t.timestamps null: false
    end
  end
end
