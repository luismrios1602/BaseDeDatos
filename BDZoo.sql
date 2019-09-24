CREATE DATABASE Zoologicos;
USE Zoologicos;

CREATE TABLE Zoologico (
idZoo int(11) PRIMARY KEY,
nombreZoo varchar(45) NOT NULL,
direccion varchar(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Cargo(
idCargo int(11) PRIMARY KEY,
nombreCargo varchar(45) NOT NULL,
salarioBase float NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Empleado(
idEmpleado int(11) PRIMARY KEY,
documentoEmpleado varchar(20) NOT NULL,
nombreEmpleado1 varchar(45) NOT NULL,
nombreEmpleado2 varchar(45) NULL DEFAULT NULL,
apellidoEmpleado1 varchar(45) NOT NULL,
apellidoEmpleado2 varchar(45) NULL DEFAULT NULL,
fechaNacimiento DATE NOT NULL,
Cargo_idCargo int(11) NOT NULL,
Zoologico_idZoo int(11) NOT NULL,
INDEX Fk_EmpleadoCargo_idx (Cargo_idCargo asc),
INDEX Fk_EmpleadoZoo_idx (Zoologico_idZoo asc),
CONSTRAINT Fk_EmpleadoCargo_cons 
FOREIGN KEY (Cargo_idCargo)
REFERENCES Zoologicos.Cargo (idCargo)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Fk_EmpleadoZoo_cons
FOREIGN KEY (Zoologico_idZoo)
REFERENCES Zoologicos.Zoologico (idZoo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Presupuesto(
idPresupuesto int(11) PRIMARY KEY,
valorPresupuesto double NOT NULL,
Zoologico_idZoo int(11) NOT NULL,
INDEX Fk_PresupuestoZoo_idx (Zoologico_idZoo ASC),
CONSTRAINT Fk_PresupuestoZoo_cons
FOREIGN KEY (Zoologico_idZoo)
REFERENCES Zoologicos.Zoologico (idZoo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Habitad(
idHabitad int(11) PRIMARY KEY,
nombreHabitad varchar(50) NOT NULL,
Zoologico_idZoo int(11) NOT NULL,
INDEX Fk_HabitadZoo_idx (Zoologico_idZoo ASC),
CONSTRAINT Fk_Habitad_cons 
FOREIGN KEY (Zoologico_idZoo)
REFERENCES Zoologicos.Zoologico (idZoo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Especie(
idEspecie int(11) PRIMARY KEY,
nombreComunEspecie varchar(45) NOT NULL,
nombreCientificoEspecie varchar(45) NOT NULL,
Habitad_idHabitad int(11) NOT NULL,
INDEX Fk_EspecieHabitad_idx (Habitad_idHabitad ASC),
CONSTRAINT Fk_EspecieHabitad_cons
FOREIGN KEY (Habitad_idHabitad)
REFERENCES Zoologicos.Habitad (idHabitad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Animal(
idAnimal int(11) PRIMARY KEY, 
nombreComunAnimal varchar(45) NOT NULL, 
nombreCientificoAnimal varchar(45) NOT NULL,
caracteristicas varchar(200) NULL DEFAULT NULL,
Especie_idEspecie int(11) NOT NULL,
INDEX Fk_AnimalEspecie_idx (Especie_idEspecie ASC),
CONSTRAINT Fk_AnimalEspecie_cons
FOREIGN KEY (Especie_idEspecie)
REFERENCES Zoologicos.Especie (idEspecie)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;