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