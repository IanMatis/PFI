--Creation des base de donnees
--bdrsh
--create database dbrsh;
use dbrsh;

drop table if exists Employes;
drop table if exists Departements;
drop table if exists Emplois;

create table Employes(
idEmploye int identity(1,1) primary key,
nomEmploye varchar(30) not null,
prenomEmploye varchar(30) not null,
adresseEmploye varchar(60) not null,
salaireEmploye int default 0,
codeDepartement char(3) not null,
codeEmploi char(3) not null
);

create table Departements(
code char(3) primary key not null,
nomDepartement varchar(30) not null
);

create table Emplois(
code char(3) primary key not null,
description varchar(60) not null,
salaireMax int not null,
salaireMin int not null,
constraint chk_sal check (salaireMin < salaireMax)
);

alter table Employes add constraint fk_Employes_Departements  Foreign key (codeDepartement) references Departements(code);
alter table Employes add constraint fk_Employes_Emplois  Foreign key (codeEmploi) references Emplois(code);
-------------------------------------
--Insert tables
--Departements
insert into Departements(code,nomDepartement) values('RSH','Ressources Humaines');
insert into Departements(code,nomDepartement) values('DEV','Developpement');
--Emplois
insert into Emplois(code,description,salaireMax,salaireMin) values('DBA','Data Base Administration',300000,120000);
insert into Emplois(code,description,salaireMax,salaireMin) values('RES','Responsable',180000,80000);
insert into Emplois(code,description,salaireMax,salaireMin) values('DEV','Developpeurs',150000,40000);
insert into Emplois(code,description,salaireMax,salaireMin) values('COM','Commis',60000,25000);
--Employes
insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('St-Louis','Martin','100 rue Perdu',270000,'RSH','DBA');
insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('Lapointe','Hugo','101 rue Perdu',60000,'RSH','COM');
insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('Lune','Saturne','102 rue Perdu',150000,'RSH','RES');
--dev
insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('Tares','Guy','103 rue Perdu',100000,'DEV','DEV');
insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('Thierry','Bien','104 rue Perdu',110000,'DEV','DEV');
insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('Lejeune','Martin','105 rue Perdu',120000,'DEV','DEV');
insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('Patache','Alain','106 rue Perdu',150000,'DEV','RES');

--Select all
select * from Emplois;
select * from Employes;
select * from Departements;
--test trigger
--insert into Employes(nomEmploye,prenomEmploye,adresseEmploye,salaireEmploye,codeDepartement,codeEmploi) values('test','test','chu rue Perdu',1,'DEV','COM');

--Triggers










