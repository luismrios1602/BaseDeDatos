CREATE DATABASE VideoJuego;
USE VideoJuego;

CREATE TABLE VideoJuegos(
idVideoJuego int(11) PRIMARY KEY,
nomVideoJuego varchar(100) NOT NULL,
version varchar(10) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Categorias(
idCategoria int(11) PRIMARY KEY,
nomCategoria varchar(50) NOT NULL
) ENGINE = InnoDB;

/* CREATE TABLE Eventos(
idEvento int(11) PRIMARY KEY,
nomEvento varchar(45) NOT NULL,
fechaInicio date NOT NULL,
fechaFin date NULL DEFAULT NULL,
puntos int(255) NOT NULL
) ENGINE = InnoDB; */

CREATE TABLE Niveles(
idNivel int(11) PRIMARY KEY,
nomNivel varchar(45) NOT NULL,
descripcionNivel varchar(200) NULL DEFAULT NULL,
puntos int(255) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Poderes(
idPoder int(11) PRIMARY KEY,
nomPoder varchar(45) NOT NULL,
descripcionPoder varchar(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE TipoEquipamiento(
idTipoEqu int(11) PRIMARY KEY,
nomTipoEqu varchar(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Equipamientos(
idEquipamiento int(11) PRIMARY KEY,
nomEquipamiento varchar(45) NOT NULL,
TipoEquipamiento_idTipoEqu int(11) NOT NULL,
VideoJuegos_idVideoJuego int(11) NOT NULL,
INDEX Fk_EquipamientoTipoEqui_idx (TipoEquipamiento_idTipoEqu ASC),
INDEX Fk_EquipamientoVideoJuegos_idx (VideoJuegos_idVideoJuego ASC),
CONSTRAINT Fk_EquipamientoTipoEqui_cons
FOREIGN KEY (TipoEquipamiento_idTipoEqu)
REFERENCES VideoJuego.TipoEquipamiento (idTipoEqu)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Fk_EquipamientoVideoJuegos_cons
FOREIGN KEY (VideoJuegos_idVideoJuego) 
REFERENCES VideoJuego.VideoJuegos (idVideoJuego)
ON DELETE NO ACTION 
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Jugadores(
idJugador int(11) PRIMARY KEY,
nomJugador varchar(45) NOT NULL,
nick varchar(45) NOT NULL,
fechaRegistro date NOT NULL,
contrasenha varchar(45) NOT NULL,
VideoJuegos_idVideoJuego int(11) NOT NULL,
Categorias_idCategoria int(11) NOT NULL,
INDEX Fk_JugadoresVideoJuegos_idx (VideoJuegos_idVideoJuego ASC),
INDEX Fk_JugadoresCategorias_idx (Categorias_idCategoria ASC),
CONSTRAINT Fk_JugadoresVideoJuegos_cons
FOREIGN KEY (VideoJuegos_idVideoJuego) 
REFERENCES VideoJuego.VideoJuegos (idVideoJuego)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Fk_JugadoresCategoria_cons
FOREIGN KEY (Categorias_idCategoria)
REFERENCES VideoJuego.Categorias (idCategoria) 
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Personajes(
idPersonaje int(11) PRIMARY KEY,
nomPersonaje varchar(45) NOT NULL,
Poderes_idPoder int(11) NOT NULL,
Equipamientos_idEquipamiento int(11) NOT NULL,
Jugadores_idJugador int(11) NOT NULL,
INDEX Fk_PersonajesPoderes_idx (Poderes_idPoder asc),
INDEX Fk_PersonajesEquipamientos_idx (Equipamientos_idEquipamiento asc),
INDEX Fk_PersonajesJugadores_idx (Jugadores_idJugador asc),
CONSTRAINT Fk_PersonajesPoderes_cons 
FOREIGN KEY (Poderes_idPoder) 
REFERENCES VideoJuego.Poderes (idPoder)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Fk_PersonajesEquipamiento_cons 
FOREIGN KEY (Equipamientos_idEquipamiento)
REFERENCES VideoJuego.Equipamientos (idEquipamiento) 
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Fk_PersonajesJugadores_cons
FOREIGN KEY (Jugadores_idJugador)
REFERENCES VideoJuego.Jugadores (idJugador)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Record (
idRecord int(11) PRIMARY KEY,
acumulado int(11) NOT NULL,
fechaRecord date NOT NULL,
Jugadores_idJugador int(11) NOT NULL,
Niveles_idNivel int(11) NOT NULL,
INDEX Fk_RecordJugadores_idx (Jugadores_idJugador ASC),
INDEX Fk_RecordNiveles_idx (Niveles_idNivel ASC),
CONSTRAINT Fk_RecordJugadores_cons 
FOREIGN KEY (Jugadores_idJugador)
REFERENCES VideoJuego.Jugadores (idJugador)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Fk_RecordNiveles_idx 
FOREIGN KEY (Niveles_idNivel)
REFERENCES VideoJuego.Niveles (idNivel)
ON DELETE NO ACTION
ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 
 CREATE TABLE Sesiones (
 idSesion int(11) PRIMARY KEY,
 Jugadores_idJugador int(11) NOT NULL,
 INDEX Fk_SesionesJugadores_idx (Jugadores_idJugador asc),
 CONSTRAINT Fk_SesionesJugadores_cons 
 FOREIGN KEY (Jugadores_idJugador)
 REFERENCES VideoJuego.Jugadores (idJugador)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 
 CREATE TABLE DetalleSesion (
 idDetalleSes int(11) PRIMARY KEY,
 fechaIniSesion date NOT NULL,
 horaIniSesion datetime NOT NULL,
 fechaFinSesion date NULL DEFAULT NULL,
 horaFinSesion datetime NULL DEFAULT NULL,
 Sesiones_idSesion int(11) NOT NULL,
 INDEX Fk_DetalleSesiones_idx (Sesiones_idSesion ASC),
 CONSTRAINT Fk_DetalleSesiones_cons
 FOREIGN KEY (Sesiones_idSesion)
 REFERENCES VideoJuego.Sesiones (idSesion)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 
 CREATE TABLE Partidas (
 idPartida int(11) PRIMARY KEY,
 codigoPartida varchar(45) NOT NULL,
 Jugadores_idJugador int(11) NOT NULL,
 INDEX Fk_PartidasJugadores_idx (Jugadores_idJugador asc),
 CONSTRAINT Fk_PartidasJugadores_cons
 FOREIGN KEY (Jugadores_idJugador)
 REFERENCES VideoJuego.Jugadores (idJugador) 
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 
 CREATE TABLE DetallePartida (
 idDetallePar int(11) PRIMARY KEY,
 fechaIniPartida date NOT NULL,
 horaIniPartida datetime NOT NULL, 
 fechaFinPartida date NULL DEFAULT NULL,
 horaFinPartida datetime NULL DEFAULT NULL,
 Partidas_idPartida int(11) NOT NULL,
 INDEX Fk_DetallePartidas_idx (Partidas_idPartida asc),
 CONSTRAINT Fk_DetallePartidas_cons
 FOREIGN KEY (Partidas_idPartida)
 REFERENCES VideoJuego.Partidas (idPartida)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION
 ) ENGINE = InnoDB;
 