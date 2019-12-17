--create database dbdev;
use dbdev;

--Drop tables
drop table if exists Avoirs;
drop table if exists Reponses;
drop table if exists Questions;
drop table if exists Score;
drop table if exists Categories;
drop table if exists Joueurs;


--Create tables
create table Joueurs
(
idJoueur int identity(1,1),
Alias VARCHAR(20) not null,
nom VARCHAR(30) not null,
prenom VARCHAR(30) not null,
constraint pk_idJoueur primary key(idJoueur)
);

create table Categories
(
idCategorie int identity(1,1),
nomCategorie VARCHAR(30) not null,
Couleur CHAR(1),
constraint pk_idCategorie primary key(idCategorie)
);

create table Score
(
idCategorie int not null,
idJoueur int not null,nbBonneReponses int default 0,nbMauvaiseReponses int default 0,constraint fk_Score_categories foreign key(idCategorie) references Categories(idCategorie),
constraint fk_Score_joueurs foreign key(idJoueur) references Joueurs(idJoueur),
constraint pk_score primary key(idCategorie,idJoueur)
);

create table Questions
(
idQuestion int identity(1,1),
enonceQuestion VARCHAR(120),
flag int default 0,
idCategorie int not null,
constraint pk_questions primary key(idQuestion),
constraint fk_Question_categories foreign key(idCategorie) references Categories(idCategorie)
);

create table Reponses
(
idReponse int identity(1,1),
enonceReponse VARCHAR(60),
estBonne int default 0,
idQuestion int not null,
constraint pk_reponses primary key(idReponse),
constraint fk_Reponses_questions foreign key(idQuestion) references Questions(idQuestion)
);

create table Avoirs
(
noJoueur int,
nbOr int default 0,
nbArgent int default 0,
nbBronze int default 0,
constraint pk_avoir primary key(noJoueur),
constraint fk_Avoirs_Joueurs foreign key(noJoueur) references Joueurs(idJoueur)
);

--Select all
select * from Joueurs;
select * from Categories;
select * from Score;
select * from Questions;
select * from Reponses;
select * from Avoirs;

-----------------------------------------------------------------------------------------------------------------------
--insert into Pour le Jeu Trivial...
--insert into Joueurs 
insert into Joueurs(Alias,nom,prenom) values('DEV1','G','T');
insert into Joueurs(Alias,nom,prenom) values('DEV2','B','T');
insert into Joueurs(Alias,nom,prenom) values('DEV3','M','L');
insert into Joueurs(Alias,nom,prenom) values('DEV4','A','P');

--insert into Categories									
insert into Categories(nomCategorie,Couleur) values('Sport','O');--Orange
insert into Categories(nomCategorie,Couleur) values('Anime','J');--Jaune
insert into Categories(nomCategorie,Couleur) values('Jeu Video','B');--Bleu
insert into Categories(nomCategorie,Couleur) values('Animaux','V');--Violet

--insert into Score
--trigger sur Joueur quand un est insert cree un Score pour ce Joueur

--insert into Questions
--Question de Sport Orange
insert into Questions(enonceQuestion,idCategorie) values('Que lance-t-on avec une raquette de badminton ?',1);
insert into Questions(enonceQuestion,idCategorie) values('O� les boxeurs ne peuvent ils pas frapper ?',1);
insert into Questions(enonceQuestion,idCategorie) values('Le biathlon se compose de 2 disciplines :',1);
insert into Questions(enonceQuestion,idCategorie) values('Quel sport ne fait pas partie du triathlon ?',1);
insert into Questions(enonceQuestion,idCategorie) values('Un boxeur est d�clar� K.O. apr�s :',1);
insert into Questions(enonceQuestion,idCategorie) values('Combien de quilles y a-t-il sur la piste de bowling ? ',1);
insert into Questions(enonceQuestion,idCategorie) values('Quelle couleur a la ceinture d�un d�butant au judo ?',1);
insert into Questions(enonceQuestion,idCategorie) values('De quelle couleur est la carte qu�un arbitre montre lorsqu�il veut faire sortir un joueur du terrain ?',1);
insert into Questions(enonceQuestion,idCategorie) values('En tennis de table, le gagnant est celui qui atteint en premier le score de :',1);
insert into Questions(enonceQuestion,idCategorie) values('Combien de joueur y a t-il sur un terrain de Voleyball en jeu?',1);

--Question de Anime Jaune
insert into Questions(enonceQuestion,idCategorie) values('Quel est le Titre du Troisieme Opening de Bakemonogatari ?',2);
insert into Questions(enonceQuestion,idCategorie) values('Quel est le nom du personnage masculin principal dans la Bakemonogatari series ?',2);
insert into Questions(enonceQuestion,idCategorie) values('Dans quel anime le personnage principal est un super heros chauve qui tue ses enemies avec un seul coup de poing ?',2);
insert into Questions(enonceQuestion,idCategorie) values('Comment s apelle le personnage feminin principal dans l anime Darling in the Franxx',2);
insert into Questions(enonceQuestion,idCategorie) values('Comment s apelle les deux protagonistes dans fullmetal alchemist ?',2);
insert into Questions(enonceQuestion,idCategorie) values('Lequel de ces personnages n est pas dans Hunter X Hunter :',2);
insert into Questions(enonceQuestion,idCategorie) values('Dans l anime Konosuba quel personnage feminin est une d�esse inutile ?',2);
insert into Questions(enonceQuestion,idCategorie) values('Quel est le nom du personnage principale dans l anime Demon Slayer ?',2);
insert into Questions(enonceQuestion,idCategorie) values('Quel est le nom de la soeur(d�mon) du personnage principal dans l anime Demon Slayer ?',2);
insert into Questions(enonceQuestion,idCategorie) values('En automne 2019 quel saison de l anime My Hero Academia est difus� :',2);

--Question de Jeu Video Bleu
insert into Questions(enonceQuestion,idCategorie) values('Comment s apelle l inteligence artificiel qui aide Master Chief dans le jeu Halo ?',3);
insert into Questions(enonceQuestion,idCategorie) values('Quel personnage n existe pas dans League of Legends :',3);
insert into Questions(enonceQuestion,idCategorie) values('Quel personnage dans League of Legends a comme arme : un lance rocket et un minigun ?',3);
insert into Questions(enonceQuestion,idCategorie) values('Dans quel Gears of war le personnage Dominique Santiago meurt-il ?',3);
insert into Questions(enonceQuestion,idCategorie) values('Quel compagnie a fait le jeu : The Elder Scrolls | Skyrim ?',3);
insert into Questions(enonceQuestion,idCategorie) values('Quel compagnie a fait le jeu : Fallout 3 ?',3);
insert into Questions(enonceQuestion,idCategorie) values('Quel compagnie a fait le jeu : Red Dead Redemption 2 ?',3);
insert into Questions(enonceQuestion,idCategorie) values('Quel compagnie a fait le jeu : Far Cry 3 ?',3);
insert into Questions(enonceQuestion,idCategorie) values('En quelle ann�e la premiere �dition de RuneScape a publi� ?',3);
insert into Questions(enonceQuestion,idCategorie) values('En quelle ann�e le jeu League of Legends a officiellement publi� ?',3);

--Question de Animaux Violet
insert into Questions(enonceQuestion,idCategorie) values('Quel oiseau est un symbole international de paix ?',4);
insert into Questions(enonceQuestion,idCategorie) values('Quelle esp�ce de rhinoc�ros n�existe pas ?',4);
insert into Questions(enonceQuestion,idCategorie) values('La libellule est un insecte que l�on rencontre surtout :',4);
insert into Questions(enonceQuestion,idCategorie) values('Combien de yeux une araignee possede t-elle ?',4);
insert into Questions(enonceQuestion,idCategorie) values('A quelle vitesse peut courir une autruche ?',4);
insert into Questions(enonceQuestion,idCategorie) values('La vip�re est un serpent venimeux mais elle a elle-m�me des ennemis. Son plus grand ennemi est :',4);
insert into Questions(enonceQuestion,idCategorie) values('Le cou de la girafe est tr�s long. Combien de vert�bres cervicales comporte-t-il ? ',4);
insert into Questions(enonceQuestion,idCategorie) values('Quel animal nous donne le jambon ?',4);
insert into Questions(enonceQuestion,idCategorie) values('Certains oiseaux, comme le colibri, peuvent :',4);
insert into Questions(enonceQuestion,idCategorie) values('O� se trouve l�aiguillon du scorpion qui s�cr�te le venin ?',4);

--insert into Reponses
--Reponse Sport
--Q1
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Un volant',1,1);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Une balle',0,1);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Une fl�chette',0,1);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Une puck',0,1);

--Q2
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sous la ceinture',1,2);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sur le visage',0,2);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sur le thorax',0,2);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sur les seins',0,2);
--Q3
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Trampoline et tir � la carabine',0,3);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ski de fond et trampoline',0,3);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ski de fond et tir � la carabine',1,3);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Boxe et lutte',0,3);
--Q4
insert into Reponses(enonceReponse,estBonne,idQuestion) values('La natation',0,4);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le cyclisme',0,4);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('La lutte',1,4);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('La course',0,4);
--Q5
insert into Reponses(enonceReponse,estBonne,idQuestion) values('5 secondes',0,5);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('10 secondes',1,5);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('15 secondes',0,5);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('27 secondes',0,5);
--Q6
insert into Reponses(enonceReponse,estBonne,idQuestion) values('10',1,6);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('9',0,6);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('11',0,6);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12',0,6);
--Q7
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Blanc',1,7);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Jaune',0,7);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Noire',0,7);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Bleu',0,7);
--Q8
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Vert',0,8);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Jaune',0,8);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Rouge',1,8);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Noir',0,8);
--Q9
insert into Reponses(enonceReponse,estBonne,idQuestion) values('21',1,9);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('40',0,9);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('45',0,9);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12',0,9);
--Q10
insert into Reponses(enonceReponse,estBonne,idQuestion) values('7',0,10);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('6',1,10);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('4',0,10);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12',0,10);

--Reponse Anime
--Q11
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Renai Circulation',1,11);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Platinum Disco',0,11);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Kanashii Ureshii',0,11);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Unravel',0,11);
--Q12
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Koyomi Araragi',1,12);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Koyomi Aragi',0,12);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Koyomi Arararararagi',0,12);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Gino Chouinard',0,12);
--Q13
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Evangelion',0,13);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Psycho-Pass',0,13);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('One punch man',1,13);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('K-ON',0,13);
--Q14
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ichigo',0,14);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Zero two',1,14);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Kiss-Shot',0,14);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Asuna',0,14);
--Q15
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Edward et Alphonse',1,15);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Edward et Roy',0,15);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Kirito et Gon',0,15);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Bill et bob',0,15);
--Q16
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Hisoka',0,16);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Kurapika',0,16);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Naruto',1,16);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Gon',0,16);
--Q17
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Aqua',1,17);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Megumin',0,17);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Lalatina',0,17);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Chris',0,17);
--Q18
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Tanjiro',1,18);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Inosuke',0,18);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Muzan',0,18);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Zenitsu',0,18);
--Q19
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Muzan',0,19);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sakura',0,19);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Nezuko',1,19);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Tami',0,19);
--Q20
insert into Reponses(enonceReponse,estBonne,idQuestion) values('1',0,20);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('4',1,20);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('5',0,20);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12',0,20);

--Reponse Jeu Video
--Q21
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Siri',0,21);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Cortana',1,21);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sonia',0,21);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Yan',0,21);
--Q22
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Artemis',1,22);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ziggs',0,22);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Aurelion sol',0,22);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Zed',0,22);
--Q23
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Zed',0,23);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Katarina',0,23);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Jinx',1,23);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Caitlyn',0,23);
--Q24
insert into Reponses(enonceReponse,estBonne,idQuestion) values('1',0,24);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2',0,24);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('3',1,24);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12',0,24);
--Q25
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ubisoft',0,25);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Bethesda',1,25);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Rockstar',0,25);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Activision',0,25);
--Q26
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ubisoft',0,26);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Bethesda',1,26);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Rockstar',0,26);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Activision',0,26);
--Q27
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ubisoft',0,27);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Bethesda',0,27);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Rockstar',1,27);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Activision',0,27);
--Q28
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Ubisoft',1,28);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Bethesda',0,28);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Rockstar',0,28);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Activision',0,28);
--Q29
insert into Reponses(enonceReponse,estBonne,idQuestion) values('1998',0,29);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2001',1,29);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2004',0,29);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2012',0,29);
--Q30
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2009',1,30);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2006',0,30);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2012',0,30);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('1212',0,30);

--Reponse Animaux
--Q31
insert into Reponses(enonceReponse,estBonne,idQuestion) values('La colombe',1,31);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('L hirondelle',0,31);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('La cigogne',0,31);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le pan',0,31);
--Q32
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le rhinoc�ros blanc',0,32);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le rhinoc�ros noir',0,32);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le rhinoc�ros brun',1,32);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Aucun',0,32);
--Q33
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Au bord de l�eau',1,33);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Dans la for�t',0,33);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Dans la montagne',0,33);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Dans un bar',0,33);
--Q34
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2',0,34);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('4',0,34);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('8',1,34);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12',0,34);
--Q35
insert into Reponses(enonceReponse,estBonne,idQuestion) values('70 km/h',1,35);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('15 km/h',0,35);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('95 km/h',0,35);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12 km/h',0,35);
--Q36
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le renard',0,36);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le blaireau',0,36);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('L homme',1,36);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('La licorne',0,36);
--Q37
insert into Reponses(enonceReponse,estBonne,idQuestion) values('2',0,37);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('7',1,37);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('25',0,37);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('12',0,37);
--Q38
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le porc',1,38);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('La vache',0,38);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le cheval',0,38);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Le renard',0,38);
--Q39
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Voler sur place',1,39);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Flotter',0,39);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Surnager',0,39);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Plonger',0,39);
--Q40
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Au bout de sa langue',0,40);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sur sa tete',0,40);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Au bout de sa queue',1,40);
insert into Reponses(enonceReponse,estBonne,idQuestion) values('Sur ses pattes',0,40);


--Select all
select * from Joueurs;
select * from Categories;
select * from Score;
select * from Questions;
select * from Reponses;
select * from Avoirs;
-------------------------------------------------------------------------------------------------------------------------------------------------
--Procedure pour le Jeu Trivial
use dbdev;

drop procedure if exists insertJoueur;
drop procedure if exists chercherQuestion;
drop procedure if exists chercherReponse;
drop function  if exists validerReponse;
drop procedure if exists mettreAJourScore;
drop procedure if exists afficherCategorieGagne;
drop procedure if exists afficherCatPlusFaible;
drop procedure if exists deleteJoueur;
drop function  if exists getIdJoueur;
drop procedure if exists restartGame;
go

--Cree le joueur et son tableau de score en meme temps
create procedure insertJoueur(@alias varchar(60),@nom varchar(60),@prenom varchar(60))
as 
begin
	insert into Joueurs(Alias,nom,prenom) values(@alias,@nom,@prenom);

	declare @nbCategories int,@idJ int,@cnt int = 1;
	select @nbCategories = count(idCategorie) from Categories;
	select @idJ = idJoueur from Joueurs where Alias = @alias;

	while @cnt <= @nbCategories
	begin
		insert into Score(idCategorie,idJoueur) values(@cnt,@idJ);
		Set @cnt = @cnt + 1;
	end
end;

go

create procedure deleteJoueur(@alias varchar(60))
as 
begin
		declare @id int;
		select @id = idJoueur from Joueurs where @alias = alias;

		delete from Score where @id = idJoueur;
		delete from Joueurs where @id = idJoueur;
end;

go

--Remet a zero tout ce qui est utile dans la partie
create procedure chercherQuestion(@idCat int)
as 
begin
	declare @idQues int,@rand int = rand(10-1)+1;

	select @idQues = idQuestion from Questions where idCategorie = @idCat  and flag = 0;
	

	select TOP 1 idQuestion,enonceQuestion, flag, idCategorie from Questions 
						where idQuestion = @idQues;

	update Questions set flag = 1 where idQuestion = @idQues;
end;

go

--cherche les 4 reponses a une question
create procedure chercherReponse(@idQuestion int)
as 
begin
	select  idReponse,enonceReponse, estBonne, idQuestion from Reponses 
						where idQuestion = @idQuestion;
end;

go

--prend le id de la reponse et retourne son etat 
create function validerReponse(@idReponse int) returns int
as 
begin
	declare @flag int = 0;
	select @flag = estBonne from Reponses where idReponse = @idReponse;
	return @flag;
end;

go

create function getIdJoueur(@alias varchar(60)) returns int
as 
begin
	declare @idJoueur int = 0;
	select @idJoueur = idJoueur from Joueurs where Alias = @alias;
	return @idJoueur;
end;

go

--@reponse est la valeur que la fonction validerReponse retourne
create procedure mettreAJourScore(@reponse int,@idJoueur int,@idCategorie int)
as 
begin	
	if(@reponse = 0)
		update Score set nbMauvaiseReponses += 1 where idJoueur = @idJoueur and idCategorie = @idCategorie;
	else
		update Score set nbBonneReponses += 1 where idJoueur = @idJoueur and idCategorie = @idCategorie;
end;

go

--affiche lalias et les categorie gagner avec le id d'un joueur
create procedure afficherCategorieGagne(@idJoueur int)
as 
begin	
	select Alias,nomCategorie from Score s join Joueurs j on s.idJoueur = j.idJoueur 
										   join Categories c on s.idCategorie = c.idCategorie   
	where s.nbBonneReponses >= 3 and s.idJoueur = @idJoueur;
end;

go

--affiche lalias et les categorie gagner avec le id d'un joueur
create procedure afficherCatPlusFaible(@idJoueur int)
as 
begin	
	select TOP 1 Alias,nomCategorie,s.nbBonneReponses from Score s join Joueurs j on s.idJoueur = j.idJoueur 
										   join Categories c on s.idCategorie = c.idCategorie   
	where s.idJoueur = @idJoueur
	order by s.nbBonneReponses asc;
end;

go

--Reset les score et les flags des reponses
create procedure restartGame
as
begin
	update Score set nbBonneReponses = 0;
	update Score set nbMauvaiseReponses = 0;
	update Questions set flag = 0;
end;

go

--Select all
select * from Joueurs;
select * from Categories;
select * from Score;
select * from Questions;
select * from Reponses;
