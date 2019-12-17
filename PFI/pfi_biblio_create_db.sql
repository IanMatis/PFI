use dbrsh;

drop table if exists Emprunt;
drop table if exists Exemplaires;
drop table if exists Periodiques;
drop table if exists Livres;
drop table if exists Documents;

create table Documents(
idDocument int identity(1,1),
titreDocument varchar(30) not null,
flagDispo char(1) not null,
typeDocument char(3),
constraint pk_Documents primary key(idDocument),
constraint chk_typeDocument Check (typeDocument in ('LIV','PER'))
);

create table Periodiques(
idDocument int not null,
periodicite varchar(20) not null,
dateParution date not null,
constraint pk_Periodiques primary key(idDocument),
constraint fk_Periodiques_Documents foreign key (idDocument) references Documents (idDocument),
constraint chk_periodicite Check (periodicite in ('hebdomadaire','mensuel','journalier'))
);

create table Livres(
idDocument int not null,
anneeEdition int not null,
maisonEdition varchar(30) not null,
auteurPrincipal varchar(50)not null,
constraint pk_Livres primary key(idDocument),
constraint fk_Livres_Documents foreign key (idDocument) references Documents (idDocument)
);

create table Exemplaires(
idExemplaire varchar(10) not null,
livresIdDocument int not null,
constraint pk_Exemplaires primary key(idExemplaire),
constraint fk_Exemplaires_Livres foreign key (livresIdDocument) references Livres (idDocument)
);

create table Emprunt(
datePret date not null,
dateRetour date not null,
dateReelRetour date not null,
exemplaireIdExemplaire varchar(10) not null,
employesIdEmploye int not null,
constraint pk_Emprunt primary key(exemplaireIdExemplaire,employesIdemploye),
constraint fk_Emprunt_Exemplaires foreign key (exemplaireIdExemplaire) references Exemplaires (idExemplaire),
constraint fk_Emprunt_Employes foreign key (employesIdEmploye) references Employes (idEmploye)
);

--Select all
select * from Emprunt;
select * from Exemplaires;
select * from Periodiques;
select * from Livres;
select * from Documents;

