
--Base de datos para SEAyC

createdb seayc

CREATE TABLE Notificacion(
Id SERIAL PRIMARY KEY,
Fecha DATE,
Mensaje VARCHAR(500)

);

CREATE TABLE AreasEspecializacion(
Id SERIAL PRIMARY KEY ,
RfcPonente VARCHAR(13),
Area VARCHAR(50)
);

INSERT INTO AreasEspecializacion(RfcPonente,Area ) VALUES (
'N/A',
'Matemáticas'
);
INSERT INTO AreasEspecializacion(RfcPonente,Area ) VALUES (
'N/A',
'Física'
);
INSERT INTO AreasEspecializacion(RfcPonente,Area ) VALUES (
'N/A',
'Biología'
);
INSERT INTO AreasEspecializacion(RfcPonente,Area ) VALUES (
'N/A',
'Computación'
);


CREATE TABLE AreaDeEspecialidad(
Id SERIAL PRIMARY KEY,
AreaEspecialidad VARCHAR(70),
IdFormacionAcademica INTEGER
);

CREATE TABLE CursosDeActualizacion(
Id SERIAL PRIMARY KEY,
NombreCurso VARCHAR(70),
IdFormacionAcademica INTEGER
);

CREATE TABLE FormacionAcademica(
Id  SERIAL PRIMARY KEY,
RfcPonente VARCHAR(13),
UltimoGrado VARCHAR(30),
Año DATE,
EntidadAcademica VARCHAR(40)
);

INSERT INTO FormacionAcademica(RfcPonente, UltimoGrado, Año, EntidadAcademica) VALUES(
'N/A',
'Licenciatura',
null,
'N/A'
);
INSERT INTO FormacionAcademica(RfcPonente, UltimoGrado, Año, EntidadAcademica) VALUES(
'N/A',
'Especialidad',
null,
'N/A'
);

INSERT INTO FormacionAcademica(RfcPonente, UltimoGrado, Año, EntidadAcademica) VALUES(
'N/A',
'Maestria',
null,
'N/A'
);

INSERT INTO FormacionAcademica(RfcPonente, UltimoGrado, Año, EntidadAcademica) VALUES(
'N/A',
'Doctorado',
null,
'N/A'
);

CREATE TABLE ExperienciaAcademica(
Id SERIAL PRIMARY KEY,
RfcPonente VARCHAR(13)
);

CREATE TABLE ExperienciaDocente(
Id SERIAL PRIMARY KEY,
NombreExperienciaDocente VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CargoAcademico(
Id SERIAL PRIMARY KEY,
NombreCargoAcademico VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CargoAcademicoAdmin(
Id SERIAL PRIMARY KEY,
NombreCargoAcademicoAdmin VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE RevisorDeTesis(
Id SERIAL PRIMARY KEY,
NombreRevisorDeTesis VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Publicaciones(
Id SERIAL PRIMARY KEY,
NombrePublicaciones VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Ponencias(
Id SERIAL PRIMARY KEY,
NombrePonencias VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Conferencias(
Id SERIAL PRIMARY KEY,
NombreConferencias VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Congresos(
Id SERIAL PRIMARY KEY,
NombreCongresos VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CursosImpartidos(
Id SERIAL PRIMARY KEY,
NombreCursosImpartidos VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE DireccionTesis(
Id SERIAL PRIMARY KEY,
NombreDireccionTesis VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE AsesoriasImpartidas(
Id SERIAL PRIMARY KEY,
NombreAsesoriasImpartidas VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE TutoriasImpartidas(
Id SERIAL PRIMARY KEY,
NombreTutoriasImpartidas VARCHAR(100),
IdExperienciaAcademica INTEGER,
FOREIGN KEY(IdExperienciaAcademica) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE ExperienciaProfesional(
Id SERIAL PRIMARY KEY,
RfcPonente VARCHAR(13)NOT NULL
);

CREATE TABLE EntidadAcademica(
Id SERIAL PRIMARY KEY,
NombreEntidadAcademica VARCHAR(70),
IdExperienciaProfesional INTEGER,
FOREIGN KEY(IdExperienciaProfesional) REFERENCES ExperienciaProfesional(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Empresa(
Id SERIAL PRIMARY KEY,
NombreEmpresa VARCHAR(70),
IdExperienciaProfesional INTEGER,
FOREIGN KEY(IdExperienciaProfesional) REFERENCES ExperienciaProfesional(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Reconocimientos(
Id SERIAL PRIMARY KEY ,
RfcPonente VARCHAR(13)NOT NULL
);

CREATE TABLE CurriculumVitae(
Id SERIAL PRIMARY KEY,
Rfc VARCHAR(13),
Nombre VARCHAR(30),
ApPaterno VARCHAR(30),
ApMaterno VARCHAR(30),
FechaNacimiento DATE,
Numero INT,
Calle VARCHAR(30),
Colonia VARCHAR(30),
Delegacion VARCHAR(30),
Ciudad VARCHAR(30),
Cp INT,
IdArea INT,
IdFormacion INT,
IdExperiencia INT,
IdExpProf INT,
IdReconocimientos INT,
FOREIGN KEY(IdArea) REFERENCES AreasEspecializacion(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdFormacion) REFERENCES FormacionAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdExperiencia) REFERENCES ExperienciaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdExpProf) REFERENCES ExperienciaProfesional(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdReconocimientos) REFERENCES Reconocimientos(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Ponente(
Id SERIAL PRIMARY KEY,
Rfc VARCHAR(13),
Institucion VARCHAR(70),
Nombre VARCHAR(30),
ApPaterno VARCHAR(30),
ApMaterno VARCHAR(30),
IdCurriculumVitae INT,
FOREIGN KEY(IdCurriculumVitae) REFERENCES CurriculumVitae(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CuerpoDocente(
Id SERIAL PRIMARY KEY,
Cargo VARCHAR(50),
IdPonente INT,
IdCurriculumVitae INT,
FOREIGN KEY(IdCurriculumVitae) REFERENCES CurriculumVitae(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdPonente) REFERENCES Ponente(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Recibir(
IdNotificacion INT,
IdInteresado INT,
IdPonente INT,
FOREIGN KEY(IdNotificacion) REFERENCES Notificacion(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdInteresado) REFERENCES Interesado(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdPonente) REFERENCES Ponente(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CelularInteresado(
Id SERIAL PRIMARY KEY,
Celular INT,
IdInteresado INT,
FOREIGN KEY(IdInteresado) REFERENCES Interesado(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE TelefonoInteresado(
Id SERIAL PRIMARY KEY,
Telefono INT,
IdInteresado INT,
FOREIGN KEY(IdInteresado) REFERENCES Interesado(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CorreoElectronicoInteresado(
Id SERIAL PRIMARY KEY,
CorreoElectronico VARCHAR(30),
IdInteresado INT,
FOREIGN KEY(IdInteresado) REFERENCES Interesado(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Contenido(
Id SERIAL PRIMARY KEY,
NumeroTema INT,
Tema VARCHAR(100),
NumeroHoras INTEGER,
NombrePonente VARCHAR(90),
Fecha DATE,
IdPonente INT,
Subtemas VARCHAR(1000),
Bibliografia VARCHAR(1000)
);

CREATE TABLE Tipo(
Id SERIAL PRIMARY KEY,
NombreTipo VARCHAR(70)
);

INSERT INTO Tipo(NombreTipo) Values('Curso');
INSERT INTO Tipo(NombreTipo) Values('Diplomado');
INSERT INTO Tipo(NombreTipo) Values('Curso Diplomado');
INSERT INTO Tipo(NombreTipo) Values('Coloquio');
INSERT INTO Tipo(NombreTipo) Values('Taller');
INSERT INTO Tipo(NombreTipo) Values('Jornada');
INSERT INTO Tipo(NombreTipo) Values('Seminario');

CREATE TABLE Modalidad(
Id SERIAL PRIMARY KEY,
NombreModalidad VARCHAR(70)
);

INSERT INTO Modalidad(NombreModalidad) Values('Presencial');
INSERT INTO Modalidad(NombreModalidad) Values('Semipresencial');
INSERT INTO Modalidad(NombreModalidad) Values('En Linea');

CREATE TABLE AreaAcademica(
Id SERIAL PRIMARY KEY,
NombreAreaAcademica VARCHAR(70)
);

INSERT INTO AreaAcademica(NombreAreaAcademica) Values('Ciencias Fisico-Matemáticas');
INSERT INTO AreaAcademica(NombreAreaAcademica) Values('Ciencias Biológicas, Químicas y de la Salud');
INSERT INTO AreaAcademica(NombreAreaAcademica) Values('Ciencias Sociales');
INSERT INTO AreaAcademica(NombreAreaAcademica) Values('Humanidades y de las Artes');
INSERT INTO AreaAcademica(NombreAreaAcademica) Values('Formación Pedagógica');

CREATE TABLE Materia(
Id SERIAL PRIMARY KEY,
NombreMateria VARCHAR(70)
);

INSERT INTO Materia(NombreMateria) Values('Biología');
INSERT INTO Materia(NombreMateria) Values('Física');
INSERT INTO Materia(NombreMateria) Values('Matemáticas');
INSERT INTO Materia(NombreMateria) Values('Actuaría');

CREATE TABLE Disciplina(
Id SERIAL PRIMARY KEY,
NombreDisciplina VARCHAR(70)
);

INSERT INTO Disciplina(NombreDisciplina) Values('Analisis Biogeográfico');
INSERT INTO Disciplina(NombreDisciplina) Values('Arácnidos de México (Biología)');
INSERT INTO Disciplina(NombreDisciplina) Values('Bioestadística');
INSERT INTO Disciplina(NombreDisciplina) Values('Ciencias Naturales');
INSERT INTO Disciplina(NombreDisciplina) Values('Cómputo');
INSERT INTO Disciplina(NombreDisciplina) Values('Dibujo de la Naturaleza (Ilustración)');
INSERT INTO Disciplina(NombreDisciplina) Values('Fauna Silvestre');
INSERT INTO Disciplina(NombreDisciplina) Values('Genética Forense');
INSERT INTO Disciplina(NombreDisciplina) Values('Gestión de Fondos y Administración de Proyectos');

INSERT INTO Disciplina(NombreDisciplina) Values('Herramientas en AVE');
INSERT INTO Disciplina(NombreDisciplina) Values('Impacto Ambiental');
INSERT INTO Disciplina(NombreDisciplina) Values('Informática');
INSERT INTO Disciplina(NombreDisciplina) Values('Latex y Knitr');
INSERT INTO Disciplina(NombreDisciplina) Values('Matemáticas');
INSERT INTO Disciplina(NombreDisciplina) Values('Metodología Lean-Agile');
INSERT INTO Disciplina(NombreDisciplina) Values('Solvencia II');

CREATE TABLE PublicoDirigido(
Id SERIAL PRIMARY KEY, 
NombrePublico VARCHAR(70)
);

INSERT INTO PublicoDirigido(NombrePublico) Values('Alumnos');
INSERT INTO PublicoDirigido(NombrePublico) Values('Profesores');
INSERT INTO PublicoDirigido(NombrePublico) Values('Iniciativa Privada');
INSERT INTO PublicoDirigido(NombrePublico) Values('Sector Público');

CREATE TABLE Sede(
Id SERIAL PRIMARY KEY,
NombreSede VARCHAR(70)
);

INSERT INTO Sede(NombreSede) Values('SEAyC');

CREATE TABLE Situacion(
Id SERIAL PRIMARY KEY,
NombreSituacion VARCHAR(40)
);

INSERT INTO Situacion(NombreSituacion) Values('En Inscripción');
INSERT INTO Situacion(NombreSituacion) Values('En Desarrollo');
INSERT INTO Situacion(NombreSituacion) Values('Concluido');
INSERT INTO Situacion(NombreSituacion) Values('Cancelado');

CREATE TABLE InstanciaResponsable(
Id SERIAL PRIMARY KEY,
NombreInstancia VARCHAR(40)
);


INSERT INTO InstanciaResponsable(NombreInstancia) Values('SEAyC');
INSERT INTO InstanciaResponsable(NombreInstancia) Values('PEUVI');
INSERT INTO InstanciaResponsable(NombreInstancia) Values('DGAPA/ PASD BACH');
INSERT INTO InstanciaResponsable(NombreInstancia) Values('DGAPA/ PASD LIC');


CREATE TABLE ControlDeEvento(
Id SERIAL PRIMARY KEY,
NombreActividad VARCHAR(200),
NumeroPonentes INTEGER,
NumeroAyudantes INTEGER,
NumeroBecados INTEGER,
NumeroInscritos INTEGER,
NumeroConstanciaAlumno INTEGER,
NumeroConstanciaProfesor INTEGER,
Observaciones VARCHAR(1000),
IdSituacion INTEGER,
IdInstanciaResponsable INTEGER,
FOREIGN KEY(IdSituacion) REFERENCES Situacion(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdInstanciaResponsable) REFERENCES InstanciaResponsable(Id) ON UPDATE CASCADE ON DELETE CASCADE	
);

CREATE TABLE Administrador(
Id SERIAL PRIMARY KEY,
NombreAdministrador VARCHAR(30),
Contraseña VARCHAR(30),
IdControlDeEvento INTEGER
);

CREATE TABLE ComiteAcademico(
Id SERIAL PRIMARY KEY,
Area VARCHAR(30)
);


CREATE TABLE Actividad(
Id SERIAL PRIMARY KEY,
Nombre VARCHAR(80),
NombreModulo VARCHAR(200),
Descripcion VARCHAR(500),
DuracionHoras FLOAT,
NumeroSesiones INTEGER,
ObjetivoEspecifico VARCHAR(700),
ObjetivoGeneral VARCHAR(700),
MaterialDidactico VARCHAR(500),
Dias VARCHAR(500),
Horario VARCHAR(500),
Aula VARCHAR(100),
Duracion VARCHAR(100),
FechaInicio DATE,
FechaFinal DATE,
CupoMaximo INTEGER,
CupoMinimo INTEGER,
Metas VARCHAR(1000),
CostoGeneral FLOAT,
CostoAlumnos FLOAT,
MaterialesParaAlumnos VARCHAR(1000),
MaterialesDeAlumnos VARCHAR(1000),
IdPonente INTEGER,
IdContenido INTEGER,
IdTipo INTEGER,
IdModalidad INTEGER,
IdAreaAcademica INTEGER,
IdMateria INTEGER,
IdDisciplina INTEGER,
IdPublicoDirigido INTEGER,
IdSede INTEGER,
IdAdministrador INTEGER,
IdComiteAcademico INTEGER,
FOREIGN KEY(IdPonente) REFERENCES Ponente(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdContenido) REFERENCES Contenido(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdTipo) REFERENCES Tipo(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdModalidad) REFERENCES Modalidad(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdAreaAcademica) REFERENCES AreaAcademica(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdMateria) REFERENCES Materia(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdDisciplina) REFERENCES Disciplina(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdPublicoDirigido) REFERENCES PublicoDirigido(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdSede) REFERENCES Sede(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdAdministrador) REFERENCES Administrador(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdComiteAcademico) REFERENCES ComiteAcademico(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE RequisitosIngreso(
Id SERIAL PRIMARY KEY,
NombreRequisitosIngreso VARCHAR(1000),
IdPonente INTEGER,
IdActividad INTEGER,
FOREIGN KEY(IdPonente) REFERENCES Ponente(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdActividad) REFERENCES Actividad(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE RequisitosPermanencia(
Id SERIAL PRIMARY KEY,
NombreRequisitosPermanencia VARCHAR(1000),
IdPonente INT,
IdActividad INT,
FOREIGN KEY(IdPonente) REFERENCES Ponente(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdActividad) REFERENCES Actividad(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE RequisitosEgreso(
Id SERIAL PRIMARY KEY,
NombreRequisitosEgreso VARCHAR(1000),
IdPonente INT,
IdActividad INT,
FOREIGN KEY(IdPonente) REFERENCES Ponente(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdActividad) REFERENCES Actividad(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Interesado(
Id SERIAL PRIMARY KEY,
Rfc VARCHAR(13),
Institucion VARCHAR(30),
Nombre VARCHAR(30),
ApPaterno VARCHAR(30),
ApMaterno VARCHAR(30),
NumeroDeCuenta INT
);

CREATE TABLE Inscribir(
IdInteresado INT,
IdActividad INT,
FOREIGN KEY(IdInteresado) REFERENCES Interesado(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdActividad) REFERENCES Actividad(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Registrar(
IdActividad INT,
IdInteresado INT,
FOREIGN KEY(IdInteresado) REFERENCES Interesado(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdActividad) REFERENCES Actividad(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Impartir(
IdDocente INT,
IdActividad INT,
FOREIGN KEY(IdDocente) REFERENCES CuerpoDocente(Id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(IdActividad) REFERENCES Actividad(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE CelularCurriculum(
Id SERIAL PRIMARY KEY,
IdCurriculumVitae INT,
Celular INT,
FOREIGN KEY(IdCurriculumVitae) REFERENCES CurriculumVitae(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE TelefonoCurriculum(
Id SERIAL PRIMARY KEY,
IdCurriculumVitae INT,
Telefono INT,
FOREIGN KEY(IdCurriculumVitae) REFERENCES CurriculumVitae(Id) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE CorreoCurriculum(
Id SERIAL PRIMARY KEY,
IdCurriculumVitae INT,
CorreoElectronico VARCHAR(40),
FOREIGN KEY(IdCurriculumVitae) REFERENCES CurriculumVitae(Id) ON UPDATE CASCADE ON DELETE CASCADE
);

