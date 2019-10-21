create database BDCarreras;
use BDCarreras;

create table Posiciones(
idPosicion int(11) primary key auto_increment,
pos varchar(2) not null,
puntos int(2) not null
) engine = InnoDB;

create table Escuderias(
idEscuderia int(11) primary key auto_increment,
nombre varchar(45) not null,
pais varchar(45) null default null
) engine = InnoDB;

create table Pilotos(
idPiloto int(11) primary key auto_increment,
nombre varchar(45) not null,
apellidos varchar(45) not null,
nacionalidad varchar(50) null default null,
fechaNacimiento date not null,
Escuderias_idEscuderia int(11) not null,
index Fk_PilotosEscuderias_idx (Escuderias_idEscuderia asc),
constraint Fk_PilotosEscuderias_cons
foreign key (Escuderias_idEscuderia)
references BDCarreras.Escuderias (idEscuderia)
on delete no action 
on update no action
) engine = InnoDB;

create table Carreras(
idCarrera int(11) primary key auto_increment,
nombre varchar(100) not null,
fecha date not null,
destino varchar(60) not null
) engine = InnoDB;

create table Registro(
idRegistro int(11) primary key auto_increment,
fecha date not null,
Escuderias_idEscuderia int(11) not null,
Carreras_idCarrera int(11) not null,
index Fk_RegistroEscuderias_idx (Escuderias_idEscuderia asc),
index Fk_RegistroCarreras_idx (Carreras_idCarrera asc),
constraint Fk_RegistroEscuderias_cons
foreign key (Escuderias_idEscuderia)
references BDCarreras.Escuderias (idEscuderia)
on delete no action
on update no action,
constraint Fk_RegistroCarreras_cons
foreign key (Carreras_idCarrera)
references BDCarreras.Carreras (idCarrera)
on delete no action
on update no action
)  engine = InnoDB;

create table DetalleLlegada(
idDetalleLlegada int(11) primary key auto_increment,
horaLlegada datetime not null,
Posiciones_idPosicion int(11) not null,
Carreras_idCarrera int(11) not null,
index Fk_DetalleLlegadaPosiciones_idx (Posiciones_idPosicion asc),
index Fk_DetalleLlegadaCarreras_idx (Carreras_idCarrera),
constraint Fk_DetalleLlegadaPosiciones_cons
foreign key (Posiciones_idPosicion)
references BDCarreras.Posiciones (idPosicion)
on delete no action
on update no action,
constraint Fk_DetalleLlegadaCarreras_idx
foreign key (Carreras_idCarrera)
references BDCarreras.Carreras (idCarrera)
on delete no action
on update no action
) engine = InnoDB;

/*INSERTAR DATOS*/

INSERT INTO Posiciones (pos, puntos) VALUES ('1°', 10), ('2°', 5), ('3°', 3);

INSERT INTO Escuderias (nombre, pais) VALUES ('Mercedes', 'Alemania'),('Ferrari', 'Holanda'),('McLaren', 'USA');

INSERT INTO Pilotos (nombre, apellidos, fechaNacimiento, nacionalidad, Escuderias_idEscuderia) VALUES 
('Lewis', 'Hamilton','1985-10-07', 'Inglaterra', 1),
('Valtteri', 'Bottas', '1980-02-10', 'Inglaterra', 1),
('Nicolas', 'Jackson', '1995-03-19', 'USA',1),
('Sebastián', 'Bettel', '1987-07-03', 'Aleman', 2),
('Charles', 'Leclerc', '1997-10-16', 'Polonia',2),
('Kimi', 'Raikkonen', '1979-10-17', 'Finlandia',2),
('Carlos', 'Saniz', '1994-09-01', 'España',3),
('Lando', 'Norris', '1999-11-13', 'Inglaterra', 3),
('Juan Pablo', 'Montoya', '1980-05-20','Colombia',3);

INSERT INTO Carreras (nombre, fecha, destino) VALUES
('El Tour de Gaira', '2019-10-10', 'Gaira'),
('22 horas de Maria Eugenia', '2019-10-30', 'La casa de Luis'),
('Chimila GranPix', '2019-11-03', 'Chimila City');

INSERT INTO Registro (fecha, Escuderias_idEscuderia, Carreras_idCarrera) VALUES 
('2019-10-21',1,1),
('2019-10-21',2,1),
('2019-10-21',3,1),
('2019-10-29',1,2),
('2019-10-29',2,2),
('2019-10-29',3,2),
('2019-10-31',1,3),
('2019-10-31',2,3),
('2019-10-31',3,3);

INSERT INTO DetalleLlegada (horaLlegada, Posiciones_idPosicion, Carreras_idCarrera) VALUES 
('2019-10-10 06:17', 1, 1);

/*CONSULTAR TABLAS*/

SELECT * FROM Posiciones;

SELECT * FROM Escuderias;

SELECT * FROM Pilotos;

SELECT * FROM Carreras;

SELECT * FROM Registro;

SELECT * FROM DetalleLlegada;




