CREATE DATABASE Ventas4;
USE Ventas4;

CREATE TABLE Vendedor(
idVendedor int(11) primary key auto_increment,
documento varchar(20) not null,
nombre varchar(50) not null,
direccion varchar(50) not null,
telefono varchar(51) not null,
estado bit  not null
) engine = Innodb;

select * from vendedor;

insert into vendedor (documento, nombre, direccion, telefono, estado) 
values ('123','luis','kll 32 kr 12', '304218', true),
 ('22222','camilo','avenida del rio', '321457', false),
  ('33333','pedro','La paz :v', '30125', true);

select * from vendedor where estado=0;

select nombre, telefono from vendedor where nombre='luis';

update vendedor set nombre='luis miguel' where idvendedor=1;
update vendedor set direccion='maria eugenia' where idvendedor=4;

CREATE TABLE Cliente(
idCliente int(11) primary key,
nombre varchar(45) not null,
direccion varchar(50) not null,
telefono varchar(15) null default null
) engine = InnoDB;

alter table Cliente change idCliente idCliente int(11) auto_increment;

create table Producto(
idProducto int(11) primary key auto_increment,
producto varchar(50) not null,
precio float not null
) engine = InnoDB;


CREATE TABLE Venta (
    idVenta INT(11) PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    Vendedor_idVendedor INT(11) NOT NULL,
    Cliente_idCliente INT(11) NOT NULL,
    INDEX Fk_VentaVendedor_idx (Vendedor_idVendedor ASC),
    INDEX Fk_VentaCliente (Cliente_idCliente ASC),
    CONSTRAINT Fk_VentaVendedor_cons FOREIGN KEY (Vendedor_idVendedor)
        REFERENCES ventas4.vendedor (idVendedor)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT Fk_VentaCliente_cons FOREIGN KEY (Cliente_idCliente)
        REFERENCES ventas4.cliente (idCliente)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB;

create table DetalleVenta(
idDetalleEvento int(11) primary key auto_increment,
Venta_idVenta int(11) not null, 
Producto_idProducto int(11) not null,
index Fk_DetalleVentaVenta_idx (Venta_idVenta asc),
index Fk_DetalleVentaProducto_idx (Producto_idProducto asc),
constraint Fk_DetalleVentaVenta_cons
foreign key (Venta_idVenta)
references ventas4.venta (idVenta)
on delete no action 
on update no action,
constraint Fk_DetalleVentaProducto_cons
foreign key (Producto_idProducto)
references ventas4.producto (idProducto)
on delete no action 
on update no action
) engine = InnoDB;

INSERT INTO Producto (producto, precio) VALUES ('Rolex',20000000), ('Invicta',30000000), ('PC Samsung', 3000000), ('PC Lenovo', 5000000), ('T TLX', 140000000), ('T Supra',230000000);

INSERT INTO Cliente (nombre, direccion, telefono) VALUES ('Este men Rodriguez','Calle siempre viva', '3145861452'), ('Espera Que', 'Calle Gualas pi 42 city', '1548711254');

INSERT INTO Venta (fecha, Vendedor_idVendedor, Cliente_idCliente) VALUES ('2019-10-16', 1, 2);

