class CreateActividads < ActiveRecord::Migration
  def change
    create_table :actividads do |t|
      t.integer :autorizado
      t.string :nombre
      t.string :nombremodulo
      t.text :descripcion
      t.float :duracionhoras
      t.integer :numerosesiones
      t.string :objetivoespecifico
      t.string :objetivogeneral
      t.string :materialdidactico
      t.text :dias
      t.string :horario
      t.string :aula
      t.text :duracion
      t.string :fechainicio
      t.date :fechafinal
      t.string :cupomaximo
      t.integer :cupominimo
      t.text :metas
      t.float :costogeneral
      t.float :costoalumnos
      t.text :materialesparaalumnos
      t.text :materialesdealumnos
      t.integer :idcontenido
      t.integer :idponente
      t.integer :idtipo
      t.integer :idmodalidad
      t.integer :idareaacademica
      t.integer :idmateria
      t.integer :iddisciplina
      t.integer :idpublicodirigido
      t.integer :idsede
      t.text :evaluacion

      t.timestamps 
    end
  end
end
