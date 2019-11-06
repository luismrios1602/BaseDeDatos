create database PrestamoLibros;
use PrestamoLibros; 

create table Usuarios(
idUsuario int(11) primary key auto_increment,
nombre varchar(45) not null,
documento varchar(20) not null,
direccion varchar (50) not null
)engine=InnoDB;

create table Libros(
idLibro int(11) primary key auto_increment,
titulo varchar(100) not null,
editorial varchar(100) not null, 
autor varchar(50) null default null
)engine=InnoDB;

create table Prestamos(
idPrestamo int(11) primary key auto_increment,
fecha date not null,
fechaEntrega date null default null,
Fk_IdUsuario int(11) not null,
Fk_IdLibro int(11) not null,
index Fk_PrestamosUsuarios_idx (Fk_IdUsuario asc),
constraint Fk_PrestamosUsuarios_cons
	foreign key (Fk_IdUsuario)
    references prestamolibros.Usuarios (idUsuario)
    on delete no action
    on update no action,
index Fk_PrestamosLibros_idx (Fk_IdLibro asc),
constraint Fk_PrestamosLibros_cons
	foreign key (Fk_IdLibro)
    references prestamolibros.Libros (idLibro)
    on delete no action
    on update no action
)engine = InnoDB;

insert into Usuarios (nombre, documento, direccion) 
values ('Tajir','1548','Bonda'),('Izquierdo','154748','Las Americas'),('Camilo','10095468555','Av. Del Rio');

insert into Libros (titulo, editorial, autor) 
values ('Cien años de soledad','Yoquese','Gabo'),('Mis putas tristes','Yoquese','Gabo');