CREATE DATABASE Banco1148701554;
USE Banco1148701554;

CREATE TABLE Banco (
idBanco int(11) primary key,
nombre varchar(45) not null,
direccion varchar(45) null default null, 
correo varchar(45) null default null
) ENGINE = InnoDB;

CREATE TABLE Clientes(
idCliente int(11) primary key,
nombres varchar(45) not null,
apellidos varchar (45) not null,
documento varchar(20) not null,
direccion varchar(45) null default null,
celular varchar(20) not null
) ENGINE = InnoDB;

CREATE TABLE Sucursales(
idSucursal int(11) primary key,
nombre varchar(45) not null,
direccion varchar(45) not null,
ciudad varchar(45) not null,
Banco_idBanco int(45) not null,
INDEX Fk_SucursalesBanco_idx (Banco_idBanco ASC),
CONSTRAINT Fk_SucursalesBanco_cons
FOREIGN KEY (Banco_idBanco)
REFERENCES Banco1148701554.Banco (idBanco)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Funcionarios(
idFuncionario int(11) primary key,
nombres varchar(45) not null,
apeliidos varchar(45) not null,
documento varchar(20) not null,
fechaNacimiento date null default null,
fechaRegistro date not null,
sexo bit null default null,
salario double null default null,
Sucursales_idSucursal int(11) not null,
INDEX Fk_FuncionariosSucursal_idx (Sucursales_idSucursal asc),
CONSTRAINT Fk_FuncionariosSucursal_cons
FOREIGN KEY (Sucursales_idSucursal)
REFERENCES Banco1148701554.Sucursales (idSucursal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Prestamos(
idPrestamo int(11) primary key, 
estado varchar(45) not null, 
fechaSolicitud date not null,
Funcionarios_idFuncionario int(11) not null,
Clientes_idCliente int(11) not null,
INDEX Fk_PrestamosFuncionarios_idx (Funcionarios_idFuncionario asc),
INDEX Fk_PrestaamosClientes_idx (Clientes_idCliente asc), 
CONSTRAINT Fk_PrestamosFuncionarios_cons 
FOREIGN KEY (Funcionarios_idFuncionario)
REFERENCES Banco1148701554.Funcionarios (idFuncionario)
ON DELETE NO ACTION
ON UPDATE NO ACTION, 
CONSTRAINT Fk_PrestamosClientes_idx
FOREIGN KEY (Clientes_idCliente)
REFERENCES Banco1148701554.Clientes (idCliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Pagares(
idPagare int(11) primary key,
cantCuotas int(11) not null,
valorCuota float not null,
porcenInteres int(11) not null,
fechaPrimeraCuota date not null,
fechaultimaCuota date null default null,
Prestamos_idPrestamo int(11) not null,
INDEX Fk_PagaresPrestamos_idx (Prestamos_idPrestamo asc),
CONSTRAINT Fk_PagaresPrestamos_cons 
FOREIGN KEY (Prestamos_idPrestamo)
REFERENCES Banco1148701554.Prestamos (idPrestamo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Pagos(
idPago int(11) primary key,
capital double not null,
interes double not null,
fechaPago date not null,
Prestamos_idPrestamo int(11) not null,
INDEX Fk_PagosPrestamos_idx (Prestamos_idPrestamo asc),
CONSTRAINT Fk_PagosPrestamos_cons
FOREIGN KEY (Prestamos_idPrestamo)
REFERENCES Banco1148701554.Prestamos (idPrestamo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE Cuentas(
idCuenta int(11) primary key,
numCuenta varchar(45) not null,
fechaRegistro date not null,
tipoCuenta varchar(45) not null,
Clientes_idCliente int(11) not null,
Sucursales_idSucursal int(11) not null,
INDEX Fk_CuentasClientes_idx (Clientes_idCliente asc),
INDEX Fk_CuentasSucursales_idx (Sucursales_idSucursal asc),
CONSTRAINT Fk_CuentasClientes_cons 
FOREIGN KEY (Clientes_idCliente)
REFERENCES Banco1148701554.Clientes (idCliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT Fk_CuentasSucursales_cons 
FOREIGN KEY (Sucursales_idSucursal)
REFERENCES Banco1148701554.Sucursales (idSucursal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
) ENGINE = InnoDB;
