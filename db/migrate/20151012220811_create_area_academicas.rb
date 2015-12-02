class CreateAreaAcademicas < ActiveRecord::Migration
  def change
    create_table :area_academicas do |t|
      t.text :nombrearea

      t.timestamps 
    end
  end
end
