-- création du schéma 
CREATE SCHEMA  "CTRL_capitainerie";
SET search_path="CTRL_capitainerie";


/*==============================================================*/
/* Table : AGENT                                                */
/*==============================================================*/
create table AGENT (
CODEAG               SERIAL               not null,
NOMAG                VARCHAR(30)          null,
ADRAG                VARCHAR(45)          null,
VILLEAG              VARCHAR(255)         null,
CPAG                 DECIMAL(5)           null,
TELAG                CHAR(15)             null,
FAXAG                CHAR(15)             null,
constraint PK_AGENT primary key (CODEAG)
);

/*==============================================================*/
/* Table : ARMATEUR                                             */
/*==============================================================*/
create table ARMATEUR (
NUM_ARMAT            SERIAL               not null,
NOM_ARMAT            VARCHAR(30)          null,
ADR_ARMAT            VARCHAR(45)          null,
VILLE_ARMAT          VARCHAR(25)          null,
CP_ARMAT             DECIMAL(5,0)         null,
PAYS_ARMAT           VARCHAR(25)          null,
constraint PK_ARMATEUR primary key (NUM_ARMAT)
);

/*==============================================================*/
/* Table : BATEAU                                               */
/*==============================================================*/
create table BATEAU (
NUMBAT               SERIAL               not null,
NUM_ARMAT            INT4                 not null,
NOMBAT               VARCHAR(30)          null,
TONNAGE              INT4                 null,
LONGUEURBAT           INT4                 null,
TIRANTEAU            INT4                 null,
constraint PK_BATEAU primary key (NUMBAT)
);

/*==============================================================*/
/* Index : APPARTENIR_FK                                        */
/*==============================================================*/
create  index APPARTENIR_FK on BATEAU (
NUM_ARMAT
);

/*==============================================================*/
/* Table : EMPLACEMENT                                          */
/*==============================================================*/
create table EMPLACEMENT (
NUMEMP               SERIAL               not null,
CODETYPEF            INT4                 not null,
NOMEMP               VARCHAR(30)          null,
LONGUEUREMP          INT4                 null,
TIRANTEAUMAX         INT4                 null,
TARIFJOUR            FLOAT8               null,
constraint PK_EMPLACEMENT primary key (NUMEMP)
);

/*==============================================================*/
/* Index : RECEVOIR_FK                                          */
/*==============================================================*/
create  index RECEVOIR_FK on EMPLACEMENT (
CODETYPEF
);

/*==============================================================*/
/* Table : FRET                                                 */
/*==============================================================*/
create table FRET (
CODETYPEF            SERIAL               not null,
LIBFRET              VARCHAR(35)          null,
constraint PK_FRET primary key (CODETYPEF)
);

/*==============================================================*/
/* Table : SEJOUR                                               */
/*==============================================================*/
create table SEJOUR (
NUMSEJ               SERIAL               not null,
NUMEMP               INT4                 not null,
NUMBAT               INT4                 not null,
CODEAG               INT4                 not null,
DATEARRIVEE          DATE                 null,
DUREESEJ             INT4                 null,
PROVENANCE           VARCHAR(30)          null,
DESTINATION          VARCHAR(30)          null,
constraint PK_SEJOUR primary key (NUMSEJ)
);

/*==============================================================*/
/* Index : GERER_FK                                             */
/*==============================================================*/
create  index GERER_FK on SEJOUR (
CODEAG
);

/*==============================================================*/
/* Index : CONCERNE_FK                                          */
/*==============================================================*/
create  index CONCERNE_FK on SEJOUR (
NUMBAT
);

/*==============================================================*/
/* Index : OCCUPER_FK                                           */
/*==============================================================*/
create  index OCCUPER_FK on SEJOUR (
NUMEMP
);

/*==============================================================*/
/* Table : TRANSPORTER                                          */
/*==============================================================*/
create table TRANSPORTER (
CODETYPEF            INT4                 not null,
NUMBAT               INT4                 not null,
QTEFRET              INT4                 null,
constraint PK_TRANSPORTER primary key (NUMBAT, CODETYPEF)
);

/*==============================================================*/
/* Index : REFERENCE_3_FK                                       */
/*==============================================================*/
create  index REFERENCE_3_FK on TRANSPORTER (
NUMBAT
);

/*==============================================================*/
/* Index : REFERENCE_6_FK                                       */
/*==============================================================*/
create  index REFERENCE_6_FK on TRANSPORTER (
CODETYPEF
);

alter table BATEAU
   add constraint FK_BATEAU_APPARTENI_ARMATEUR foreign key (NUM_ARMAT)
      references ARMATEUR (NUM_ARMAT)
      on delete restrict on update restrict;

alter table EMPLACEMENT
   add constraint FK_EMPLACEM_RECEVOIR_FRET foreign key (CODETYPEF)
      references FRET (CODETYPEF)
      on delete restrict on update restrict;

alter table SEJOUR
   add constraint FK_SEJOUR_CONCERNE_BATEAU foreign key (NUMBAT)
      references BATEAU (NUMBAT)
      on delete restrict on update restrict;

alter table SEJOUR
   add constraint FK_SEJOUR_GERER_AGENT foreign key (CODEAG)
      references AGENT (CODEAG)
      on delete restrict on update restrict;

alter table SEJOUR
   add constraint FK_SEJOUR_OCCUPER_EMPLACEM foreign key (NUMEMP)
      references EMPLACEMENT (NUMEMP)
      on delete restrict on update restrict;

alter table TRANSPORTER
   add constraint FK_TRANSPOR_REFERENCE_BATEAU foreign key (NUMBAT)
      references BATEAU (NUMBAT)
      on delete restrict on update restrict;

alter table TRANSPORTER
   add constraint FK_TRANSPOR_REFERENCE_FRET foreign key (CODETYPEF)
      references FRET (CODETYPEF)
      on delete restrict on update restrict;


-- 
-- Contenu de la table 'agent'

INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES (1, 'Looser', '4 rue de la metairie de loiseau', 'Paris', 75000, '01-20-25-25-00', '01-20-25-25-10');
INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES (2, 'Bertrand', '12 rue Amoreux', 'Marseille', 13000, '04-42-21-12-52', '04-42-21-12-50');
INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES (3, 'Bidule', 'le Saturne 176 rue Lausanne ', 'Montpellier', 34080 , '04-42-25-69-69', '04-42-25-69-96');
INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES ( 4, 'AIACH','11 Grande Rue','MONTMAIZIN', 11254,  '03-25-25-69-69', '03-25-25-69-96');
INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES ( 5, 'GAL',  '147 rue de Vaugirard',  'PARIS', 75015, '01-24-25-69-69', '01-24-25-69-96');
INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES ( 6, 'CHAMBON', 'ZI de la Croix Bleue',  'VERGNOLLES',  84524, '04-56-52-69-69', '04-56-52-69-96');
INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES ( 7, 'DUQUESNAY', '113 avenue Mozart',  'Marseille', 13002, '04-15-15-69-69', '04-15-15-69-96');
INSERT INTO AGENT (CODEAG, NOMAG, ADRAG, VILLEAG, CPAG, TELAG, FAXAG) VALUES ( 8, 'CHEVALLIER-CHANTEPIE','44 rue du Général Michel Bizot',  'PARIS', 75012 , '01-65-65-69-69', '01-65-65-69-96');
-- initialisation de la valeur du compteur de séquence
select setval('agent_codeag_seq',8);


-- --------------------------------------------------------
-- Contenu de la table 'ARMATEUR'
INSERT INTO ARMATEUR (NUM_ARMAT, NOM_ARMAT, ADR_ARMAT, VILLE_ARMAT, CP_ARMAT, PAYS_ARMAT) VALUES (1, 'Zorba', '1 place des Oliviers', 'Marseille', '13000', 'France');
INSERT INTO ARMATEUR (NUM_ARMAT, NOM_ARMAT, ADR_ARMAT, VILLE_ARMAT, CP_ARMAT, PAYS_ARMAT) VALUES (2, 'ARMATEUR de France', '5 rue du port', 'Brest', '29200', 'France');
INSERT INTO ARMATEUR (NUM_ARMAT, NOM_ARMAT, ADR_ARMAT, VILLE_ARMAT, CP_ARMAT, PAYS_ARMAT) VALUES (3, 'Olympe', 'place ronde', 'Athènes', '00000', 'Gréce');
-- initialisation de la valeur du compteur de séquence
select setval('armateur_num_armat_seq',3);

-- -------------------------------------------------------- 
-- Contenu de la table 'BATEAU'
INSERT INTO BATEAU (NUMBAT, NUM_ARMAT, NOMBAT, TONNAGE, LONGUEURBAT, TIRANTEAU) VALUES (1, 1, 'NORSTONE', 45, 120, 18);
INSERT INTO BATEAU (NUMBAT, NUM_ARMAT, NOMBAT, TONNAGE, LONGUEURBAT, TIRANTEAU) VALUES (2, 2, 'Mouette', 14, 25, 6);
INSERT INTO BATEAU (NUMBAT, NUM_ARMAT, NOMBAT, TONNAGE, LONGUEURBAT, TIRANTEAU) VALUES (3, 2, 'Océan', 20, 80, 10);
INSERT INTO BATEAU (NUMBAT, NUM_ARMAT, NOMBAT, TONNAGE, LONGUEURBAT, TIRANTEAU) VALUES (4, 3, 'Tahiti', 8, 45, 12);
INSERT INTO BATEAU (NUMBAT, NUM_ARMAT, NOMBAT, TONNAGE, LONGUEURBAT, TIRANTEAU) VALUES (5, 1, 'Erikaka', 250, 190, 30);
-- initialisation de la valeur du compteur de séquence
select setval('bateau_numbat_seq',5);

-- --------------------------------------------------------
-- Contenu de la table 'FRET'
INSERT INTO FRET (CODETYPEF, LIBFRET) VALUES (1, 'Céréale');
INSERT INTO FRET (CODETYPEF, LIBFRET) VALUES (2, 'Produits pétroliers');
INSERT INTO FRET (CODETYPEF, LIBFRET) VALUES (3, 'Acier');
INSERT INTO FRET (CODETYPEF, LIBFRET) VALUES (4, 'Nickel');
INSERT INTO FRET (CODETYPEF, LIBFRET) VALUES (5, 'Bois');
INSERT INTO FRET (CODETYPEF, LIBFRET) VALUES (6, 'Voiture');
-- initialisation de la valeur du compteur de séquence
select setval('fret_codetypef_seq',6);

-- --------------------------------------------------------
-- Contenu de la table 'TRANSPORTER'
INSERT INTO TRANSPORTER VALUES (2, 3, 6);
INSERT INTO TRANSPORTER VALUES (2, 2, 9);
INSERT INTO TRANSPORTER VALUES (1, 2, 10);
INSERT INTO TRANSPORTER VALUES (4, 2, 9);
INSERT INTO TRANSPORTER VALUES (2, 1, 1552);
INSERT INTO TRANSPORTER VALUES (1, 4, 1200);
INSERT INTO TRANSPORTER VALUES (2, 5, 256);
INSERT INTO TRANSPORTER VALUES (5, 5, 3456);
INSERT INTO TRANSPORTER VALUES (6, 1, 545);

-- --------------------------------------------------------
-- Contenu de la table 'EMPLACEMENT'
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (1, 1, 'A1', 60, 20, 250);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (2, 1, 'A2', 55, 10, 200);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (3, 1, 'A3', 80, 15, 250);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (4, 1, 'A4', 150, 25, 350);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (5, 2, 'A5', 25, 5, 100);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (6, 3, 'A6', 85, 11, 150);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (7, 5, 'B1', 200, 35, 550);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (8, 6, 'B2', 85, 20, 180);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (9, 6, 'B3', 175, 18, 155);
INSERT INTO EMPLACEMENT (NUMEMP, CODETYPEF, NOMEMP, LONGUEUREMP, TIRANTEAUMAX, TARIFJOUR) VALUES (10, 4, 'B4', 125, 15, 300);

-- initialisation de la valeur du compteur de séquence
select setval('emplacement_numemp_seq',10);

-- --------------------------------------------------------
-- Contenu de la table 'SEJOUR'
INSERT INTO SEJOUR (NUMSEJ, NUMEMP, NUMBAT, CODEAG, DATEARRIVEE, DUREESEJ, PROVENANCE, DESTINATION) VALUES (1, 3, 2, 1, '2008-05-01 00:00:00', 10, 'Japon', 'Espagne');
INSERT INTO SEJOUR (NUMSEJ, NUMEMP, NUMBAT, CODEAG, DATEARRIVEE, DUREESEJ, PROVENANCE, DESTINATION) VALUES (2, 4, 3, 1, '2008-04-21 00:00:00', 3, 'Angleterre', 'Gabon');
INSERT INTO SEJOUR (NUMSEJ, NUMEMP, NUMBAT, CODEAG, DATEARRIVEE, DUREESEJ, PROVENANCE, DESTINATION) VALUES (3, 3, 4, 2, '2008-05-25 00:00:00', 15, 'France', 'Canada');
INSERT INTO SEJOUR (NUMSEJ, NUMEMP, NUMBAT, CODEAG, DATEARRIVEE, DUREESEJ, PROVENANCE, DESTINATION) VALUES (4, 2, 2, 1, '2008-03-25 00:00:00', 2, 'Islande', 'Australie');
INSERT INTO SEJOUR (NUMSEJ, NUMEMP, NUMBAT, CODEAG, DATEARRIVEE, DUREESEJ, PROVENANCE, DESTINATION) VALUES (5, 1, 2, 2, '2008-06-05 00:00:00', 5, 'Suède', 'Nouvelle Zélande');
INSERT INTO SEJOUR (NUMSEJ, NUMEMP, NUMBAT, CODEAG, DATEARRIVEE, DUREESEJ, PROVENANCE, DESTINATION) VALUES (6, 1, 3, 1, '2008-06-02 00:00:00', 5,'Gréce', 'Russie');
INSERT INTO SEJOUR (NUMSEJ, NUMEMP, NUMBAT, CODEAG, DATEARRIVEE, DUREESEJ, PROVENANCE, DESTINATION) VALUES (7, 3, 2, 2, '2008-06-15 00:00:00', 6, 'Espagne', 'Mexique');
-- initialisation de la valeur du compteur de séquence
select setval('sejour_numsej_seq',7);

--4) Nom du bateau qui a séjourné le plus longtemps (durée cumulée) dans le port ;
SELECT B.NOMBAT
FROM BATEAU B
WHERE B.NUMBAT = (SELECT NUMBAT
FROM SEJOUR
GROUP BY NUMBAT
ORDER BY SUM(DUREESEJ) DESC
LIMIT 1);

--5) Toutes les informations de l'emplacement le plus long ;
SELECT *
FROM EMPLACEMENT
WHERE LONGUEUREMP = (SELECT MAX(LONGUEUREMP)
FROM EMPLACEMENT);    

--15) Donnez le bateau qui a transporté le moins de fret, quel que soit le fret, en effet un bateau a pu
--transporter plusieurs type de fret, par exemple le bateau Erikaka a transporté 256 tonnes de Produits
--pétroliers et 3456 tonnes de Bois, on veut donc connaitre celui qui a transporté la plus petite quantité
--de fret cumulé !
SELECT B.NOMBAT
FROM BATEAU B
WHERE B.NUMBAT = (SELECT NUMBAT
FROM TRANSPORTER
GROUP BY NUMBAT
ORDER BY SUM(QTEFRET) ASC
LIMIT 1);

--14) Donnez le nombre d’emplacements par fret (libfret), en effet un emplacement est prévu pour accueillir
--un seul type de fret, on veut donc connaitre le nombre d’emplacements qui peuvent accueillir chaque
--type de fret !
SELECT LIBFRET, COUNT(NUMEMP) AS NOMBRE_EMPLACEMENTS
FROM FRET F
LEFT JOIN EMPLACEMENT E ON F.CODETYPEF = E.CODETYPEF
GROUP BY F.LIBFRET;  


	  
	