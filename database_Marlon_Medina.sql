create database BD_Viajes;
use BD_Viajes;

/*Todos los varchar estan aproximados a su decimo mas cercano*/
create table Climas(
C_ID int auto_increment not null,
C_NOMBRE varchar(10)not null,
primary key(C_ID)
);

create table Tipos(
T_ID int auto_increment not null,
T_NOMBRE varchar(10) not null,
primary key(T_ID)
);

create table Nacionalidades(
N_ID int auto_increment not null,
N_NOMBRE varchar(20) not null,
primary key(N_ID)
);

create table Pasajeros(
P_ID int auto_increment not null,
P_NOMBRE varchar(20)not null,
P_APELLIDO varchar(20)not null,
P_PERFIL varchar(10)not null,
P_NACIMIENTO date not null,
P_TELEFONO varchar(11)not null, /* telefono no necesita ser aproximado excepto si vamos a el espacio supongo*/
P_N_ID int not null,
primary key(P_ID),
constraint FK_Pasajeros_Nacionalidades foreign key(P_N_ID) references Nacionalidades (N_ID)
);

create table Lugares(
L_ID int auto_increment not null,
L_NOMBRE varchar(20)not null,
L_N_ID int not null,
L_T_ID int not null,
L_C_ID int not null,
L_POBLACION bigint not null,
L_DESCRIPCION varchar(200) not null,
primary key(L_ID),
Constraint FK_Lugares_Nacionalidades foreign key(L_N_ID) references Nacionalidades (N_ID),
Constraint FK_Lugares_Tipos foreign key(L_T_ID) references Tipos (T_ID),
Constraint FK_Lugares_Climas foreign key(L_C_ID) references Climas (C_ID)
);

create table Viajes(
V_ID int auto_increment not null,
V_P_ID int not null,
V_L_ID int not null,
V_FECHA date not null,
primary key(V_ID),
constraint FK_Viajes_Pasajeros foreign key(V_P_ID) references Pasajeros(P_ID),
constraint FK_Viajes_Lugares foreign key(V_L_ID) references Lugares(L_ID)
);