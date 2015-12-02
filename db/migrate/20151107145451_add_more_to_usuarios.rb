class AddMoreToUsuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :nombre, :string
  	add_column :usuarios, :appaterno, :string
  	add_column :usuarios, :apmaterno, :string
  	add_column :usuarios, :institucion, :string
  	add_column :usuarios, :numerodecuenta, :string
    add_index :usuarios, :numerodecuenta, unique: true
    add_column :usuarios, :rfc, :string
    add_index :usuarios, :rfc, unique: true
  end
end
