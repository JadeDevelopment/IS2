
#---------------Modifica tuplas de la tabla 'CurriculumVitae'-----------------------------

def modificarRfc(r, id)
puts "UPDATE CurriculumVitae SET Rfc = '#{r}' WHERE Id = #{id}"
end

def modificarNombre(n, id)
puts "UPDATE CurriculumVitae SET Nombre = '#{n}' WHERE Id = #{id}"
end

def modificarApPaterno(a, id)
puts "UPDATE CurriculumVitae SET ApPaterno = '#{a}' WHERE Id = #{id}"
end

def modificarApMaterno(a, id)
puts "UPDATE CurriculumVitae SET ApMaterno  = '#{a}' WHERE Id = #{id}"
end

#Modifica la fecha de nacimiento
def modificarFecha(n, id)
puts "UPDATE CurriculumVitae SET FechaNacimiento = #{n} WHERE Id = #{id}"
end

#Modifica el numero de vivienda
def modificarNumero(n, id)
puts "UPDATE CurriculumVitae SET Numero = #{n} WHERE Id = #{id}"
end

def modificarCalle(n, id)
puts "UPDATE CurriculumVitae SET Calle = '#{n}' WHERE Id = #{id}"
end

def modificarColonia(n, id)
puts "UPDATE CurriculumVitae SET Colonia = '#{n}' WHERE Id = #{id}"
end

def modificarDelegacion(n, id)
puts "UPDATE CurriculumVitae SET Delegacion = '#{n}' WHERE Id = #{id}"
end

def modificarCiudad(n, id)
puts "UPDATE CurriculumVitae SET Ciudad = '#{n}' WHERE Id = #{id}"
end

def modificarCp(n, id)
puts "UPDATE CurriculumVitae SET Cp = #{n} WHERE Id = #{id}"
end

#---------FIN-----------Modifica tuplas de la tabla 'CurriculumVitae'------------------FIN---------------


#-----------agrega una nueva Area al catálogo 'AreasEspecializacion'----------------
def modificarAreas(rfc, area)
puts "INSERT INTO AreasEspecializacion(RfcPonente,Area) SET RfcPonente = '#{rfc}' SET Area = '#{area}' WHERE Id = #{id}"
end
#-----FIN------agrega una nueva Area al catálogo 'AreasEspecializacion'------FIN----------


#----------Modifica las Areas de especialidad en la tabla 'AreaDeEspecialidad'
def modificarAreasEsp(n, id)
puts "UPDATE AreaDeEspecialidad SET AreaEspecialidad = '#{n}' WHERE Id = #{id}"
end

#----------Modifica la tabla ExperienciaAcademica
def modificarExpAcad(n, id)
puts "UPDATE ExperienciaAcademica SET Delegacion = '#{n}' WHERE Id = #{id}"
end

def modificarExperienciaDocente(n, id)
puts "UPDATE ExperienciaDocente SET NombreExperienciaDocente = '#{n}' WHERE Id = #{id}"
end

def modificarCargoAcademico(n, id)
puts "UPDATE CargoAcademico SET NombreCargoAcademico = '#{n}' WHERE Id = #{id}"
end

def modificarCargoAcademicoAdmin(n, id)
puts "UPDATE CargoAcademicoAdmin SET NombreCargoAcademicoAdmin = '#{n}' WHERE Id = #{id}"
end

def modificarRevisorDeTesis(n, id)
puts "UPDATE RevisorDeTesis SET NombreRevisorDeTesis = '#{n}' WHERE Id = #{id}"
end

def modificarPublicaciones(n, id)
puts "UPDATE Publicaciones SET NombrePublicaciones = '#{n}' WHERE Id = #{id}"
end

def modificarPonencias(n, id)
puts "UPDATE Ponencias SET NombrePonencias = '#{n}' WHERE Id = #{id}"
end

def modificarConferencias(n, id)
puts "UPDATE Conferencias SET NombreConferencias = '#{n}' WHERE Id = #{id}"
end

def modificarCongresos(n, id)
puts "UPDATE Congresos SET NombreCongresos = '#{n}' WHERE Id = #{id}"
end

def modificarCursosImpartidos(n, id)
puts "UPDATE CursosImpartidos SET NombreCursosImpartidos = '#{n}' WHERE Id = #{id}"
end

def modificarDireccionTesis(n, id)
puts "UPDATE DireccionTesis SET NombreDireccionTesis = '#{n}' WHERE Id = #{id}"
end

def modificarAsesoriasImpartidas(n, id)
puts "UPDATE AsesoriasImpartidas SET NombreAsesoriasImpartidas = '#{n}' WHERE Id = #{id}"
end

def modificarTutoriasImpartidas(n, id)
puts "UPDATE TutoriasImpartidas SET NombreTutoriasImpartidas = '#{n}' WHERE Id = #{id}"
end

def modificarExperienciaProfesional(n, id)
puts "UPDATE ExperienciaProfesional SET RfcPonente = '#{n}' WHERE Id = #{id}"
end

def modificarEntidadAcademica(n, id)
puts "UPDATE EntidadAcademica SET NombreEntidadAcademica = '#{n}' WHERE Id = #{id}"
end

def modificarEmpresa(n, id)
puts "UPDATE Empresa SET NombreEmpresa = '#{n}' WHERE Id = #{id}"
end

def modificarReconocimientos(n, id)
puts "UPDATE Reconocimientos SET RfcPonente = '#{n}' WHERE Id = #{id}"
end