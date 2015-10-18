class CreateActividads < ActiveRecord::Migration
  def change
    create_table :actividads do |t|
      t.integer :Autorizado
      t.string :Nombre
      t.string :NombreModulo
      t.text :Descripcion
      t.float :DuracionHoras
      t.integer :NumeroSesiones
      t.string :ObjetivoEspecifico
      t.string :ObjetivoGeneral
      t.string :MaterialDidactico
      t.text :Dias
      t.string :Horario
      t.string :Aula
      t.text :Duracion
      t.string :FechaInicio
      t.date :FechaFinal
      t.string :CupoMaximo
      t.integer :CupoMinimo
      t.text :Metas
      t.float :CostoGeneral
      t.float :CostoAlumnos
      t.text :MaterialesParaAlumnos
      t.text :MaterialesDeAlumnos
      t.integer :IdContenido
      t.integer :IdPonente
      t.integer :IdTipo
      t.integer :IdModalidad
      t.integer :IdAreaAcademica
      t.integer :IdMateria
      t.integer :IdDisciplina
      t.integer :IdPublicoDirigido
      t.integer :IdSede
      t.text :evaluacion

      t.timestamps null: false
    end
  end
end
