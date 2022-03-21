DROP TABLE Hudobny_Nastroj CASCADE CONSTRAINTS;
DROP TABLE Hudobnik CASCADE CONSTRAINTS;
DROP TABLE Album CASCADE CONSTRAINTS;
DROP TABLE Skladba CASCADE CONSTRAINTS;
DROP TABLE Hra CASCADE CONSTRAINTS;
DROP TABLE Ovlada CASCADE CONSTRAINTS;
DROP TABLE Nosic CASCADE CONSTRAINTS;
DROP TABLE Obsahuje CASCADE CONSTRAINTS;


CREATE TABLE Hudobny_Nastroj (
    nazov VARCHAR(30) NOT NULL,
    stupnica VARCHAR(255) NOT NULL,

    CONSTRAINT PK_nazov_stupnica PRIMARY KEY (nazov, stupnica)
);

CREATE TABLE Hudobnik (
    id_hudobnik INTEGER NOT NULL,
    meno VARCHAR(30),
    ulica VARCHAR(255),
    mesto VARCHAR(255),
    telefon VARCHAR(10),

    CONSTRAINT PK_id_hudobnik PRIMARY KEY (id_hudobnik)
);

CREATE TABLE Album (
    cislo INTEGER NOT NULL,
    nazov VARCHAR (30),
    datum DATE,
    id_hudobnik INTEGER NOT NULL,

    CONSTRAINT FK_id_hudobnik_album FOREIGN KEY (id_hudobnik) REFERENCES Hudobnik,
    CONSTRAINT PK_cislo PRIMARY KEY (cislo)
);

CREATE TABLE Skladba (
    id_skladba INTEGER NOT NULL,
    nazov VARCHAR(30),
    autor VARCHAR(30),
    cislo INTEGER NOT NULL,

    CONSTRAINT FK_cislo_skladba FOREIGN KEY (cislo) REFERENCES Album,
    CONSTRAINT PK_id_skladba PRIMARY KEY (id_skladba)
);

CREATE TABLE Hra (
    nazov VARCHAR(30) NOT NULL,
    stupnica VARCHAR(255) NOT NULL,
    id_hudobnik INTEGER NOT NULL,
    id_skladba INTEGER NOT NULL,

    CONSTRAINT FK_nazov_hra FOREIGN KEY (nazov, stupnica) REFERENCES Hudobny_Nastroj,
    CONSTRAINT FK_id_hudobnik_hra FOREIGN KEY (id_hudobnik) REFERENCES Hudobnik,
    CONSTRAINT FK_id_skladba_hra FOREIGN KEY (id_skladba) REFERENCES Skladba,
    CONSTRAINT Pk_hra PRIMARY KEY (nazov, stupnica, id_hudobnik, id_skladba)
);

CREATE TABLE Ovlada (
    id_hudobnik INTEGER NOT NULL,
    nazov VARCHAR(30) NOT NULL,
    stupnica VARCHAR(255) NOT NULL,

    CONSTRAINT FK_nazov_ovlada FOREIGN KEY (nazov, stupnica) REFERENCES Hudobny_Nastroj,
    CONSTRAINT FK_id_hudobnik_ovlada FOREIGN KEY (id_hudobnik) REFERENCES Hudobnik,
    CONSTRAINT PK_hudobnik_nastroj_ovlada PRIMARY KEY (id_hudobnik, nazov, stupnica)
);

CREATE TABLE Nosic (
    typ VARCHAR(50) NOT NULL,

    CONSTRAINT PK_typ PRIMARY KEY (typ)
);

CREATE TABLE Obsahuje (
    cislo INTEGER NOT NULL,
    typ VARCHAR(255) NOT NULL,

    CONSTRAINT FK_cislo_obsahuje FOREIGN KEY (cislo) REFERENCES Album,
    CONSTRAINT FK_typ_obsahuje FOREIGN KEY (typ) REFERENCES Nosic,
    CONSTRAINT PK_cislo_typ PRIMARY KEY (cislo, typ)
);