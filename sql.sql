CREATE DATABASE gestionCompta

CREATE TABLE devise(
    idDevise SERIAL PRIMARY KEY,
    libelle VARCHAR
);

CREATE TABLE typeSaisie(
    idTypeSaisie SERIAL PRIMARY KEY,
    libelle VARCHAR
);

CREATE TABLE caracteristiqueCompta(
    idCaracteristiqueCompta SERIAL PRIMARY KEY,
    deviseTenueCompte INT,
    idTypeSaisie INT,
    FOREIGN KEY (idTypeSaisie) REFERENCES typeSaisie(idTypeSaisie),
    FOREIGN KEY (deviseTenueCompte) REFERENCES devise(idDevise)
);

CREATE TABLE organisationCompta(
    idOrganisationCompta SERIAL PRIMARY KEY,
    dateDebutExercice DATE,
    capitale DECIMAL, 
    nbDecimal INT,
    longueurNumCompte INT,
    longueurNumCompteTiers INT
);

CREATE TABLE compteGeneral(
    idCompteGeneral SERIAL PRIMARY KEY,
    numero INT,
    intitule VARCHAR
);




CREATE TABLE compteTiers(
    idCompteTiers SERIAL PRIMARY KEY,
    idCompteGeneral INT,
    code VARCHAR,
    intitule VARCHAR,
    FOREIGN KEY (idCompteGeneral) REFERENCES compteGeneral(idCompteGeneral)
);


CREATE TABLE deviseEquivalence(
    idDeviseEquivalence SERIAL PRIMARY KEY,
    idSociete INT,
    idDevise INT,
    FOREIGN KEY (idSociete) REFERENCES societe(idSociete),
    FOREIGN KEY (idDevise) REFERENCES devise(idDevise)
);

CREATE TABLE journaux(
    idJournaux SERIAL PRIMARY KEY,
    code VARCHAR,
    intitule VARCHAR
);

CREATE TABLE nif(
    idNif SERIAL PRIMARY KEY,
    idSociete INT,
    idDocument INT,
    numero VARCHAR,
    FOREIGN KEY (idSociete) REFERENCES societe(idSociete),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

CREATE TABLE ns(
    idNs SERIAL PRIMARY KEY,
    idSociete INT,
    idDocument INT,
    numero VARCHAR,
    FOREIGN KEY (idSociete) REFERENCES societe(idSociete),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);

CREATE TABLE nrcs(
    idNrcs SERIAL PRIMARY KEY,
    idSociete INT,
    idDocument INT,
    numero VARCHAR,
    FOREIGN KEY (idSociete) REFERENCES societe(idSociete),
    FOREIGN KEY (idDocument) REFERENCES document(idDocument)
);


CREATE TABLE document(
    idDocument SERIAL PRIMARY KEY,
    idSociete INT,
    documentPath VARCHAR,
    FOREIGN KEY (idSociete) REFERENCES societe(idSociete)
);


CREATE TABLE societe(
    idSociete SERIAL PRIMARY KEY,
    idOrganisationCompta INT,
    idCaracteristiqueCompta INT,
    nom VARCHAR,
    object VARCHAR, 
    adresse VARCHAR,
    telephone VARCHAR,
    email VARCHAR,
    password VARCHAR,
    dateDeCreation DATE,
    siege VARCHAR,
    nombreEmployer INT,
    nif VARCHAR,
    ns VARCHAR,
    nrcs VARCHAR,
    FOREIGN KEY (idOrganisationCompta) REFERENCES organisationCompta(idOrganisationCompta)! ,
     FOREIGN KEY (idCaracteristiqueCompta) REFERENCES caracteristiqueCompta(idCaracteristiqueCompta)
);

CREATE TABLE exercice(
    idExercice SERIAL PRIMARY KEY,
    debut date,
    fin date
);

CREATE TABLE grandLivre(
    idGrandLivre SERIAL PRIMARY KEY,
    idSociete INT,
    idCompteGeneral INT,
    idExercice INT,
    date date,
    libelle VARCHAR,
    debit DECIMAL,
    credit DECIMAL,
    FOREIGN KEY (idSociete) REFERENCES societe(idSociete),
    FOREIGN KEY (idCompteGeneral) REFERENCES compteGeneral(idCompteGeneral),
    FOREIGN KEY (idExercice) REFERENCES exercice(idExercice)
);

CREATE TABLE journal(
    idJournal SERIAL PRIMARY KEY,
    idSociete INT,
    date DATE,
    numeroPiece INT,
    referencePiece VARCHAR,
    numeroCompteGeneral INT, 
    numeroCompteTiers INT,
    libelle VARCHAR,
    debit DECIMAL,
    credit DECIMAL,
    FOREIGN KEY (idSociete) REFERENCES societe(idSociete),
    FOREIGN KEY (numeroCompteGeneral) REFERENCES compteGeneral(idCompteGeneral),
    FOREIGN KEY (numeroCompteTiers) REFERENCES compteTiers(idCompteTiers)
);

CREATE TABLE valeurDevise(
    idValeurDevise SERIAL PRIMARY KEY,
    idDevise INT,
    valeur DECIMAL,
    date DATE,
    FOREIGN KEY (idDevise) REFERENCES devise(idDevise)
);

INSERT INTO devise VALUES(1,'Ariary');
INSERT INTO devise VALUES(1,'Dollard');
INSERT INTO devise VALUES(1,'Euro');
INSERT INTO devise VALUES(1,'Mur');
INSERT INTO devise VALUES(1,'Yuan');

-- INSERT INTO caracteristiqueCompta VALUES(1,)
-- INSERT INTO societe VALUES();

-- INSERT INTO compteGeneral VALUES(1,)


INSERT INTO compteGeneral('numero','intitule') VALUES(41000,'Clients');
INSERT INTO compteGeneral('numero','intitule') VALUES(40000,'Fournisseurs');
INSERT INTO compteGeneral('numero','intitule') VALUES(51200,'Banque');
INSERT INTO compteGeneral('numero','intitule') VALUES(40110,'Client locaux');
INSERT INTO compteGeneral('numero','intitule') VALUES(40120,'Client etranger');
INSERT INTO compteGeneral('numero','intitule') VALUES(40910,'Fournisseur:facture a recevoir');
INSERT INTO compteGeneral('numero','intitule') VALUES(53000,'Caisse');
INSERT INTO compteGeneral('numero','intitule') VALUES(60000,'Charges');
INSERT INTO compteGeneral('numero','intitule') VALUES(70000,'Produits');
INSERT INTO compteGeneral('numero','intitule') VALUES(20000,'Immobilisations');
-- INSERT INTO compteGeneral('numero','intitule') VALUES(53000,'Caisse');
-- INSERT INTO compteGeneral('numero','intitule') VALUES(53000,'Caisse');

INSERT INTO compteTiers('idCompteGeneral','code','intitule') VALUES(,'AC')


