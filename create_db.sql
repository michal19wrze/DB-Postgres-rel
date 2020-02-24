CREATE TABLE trener
(
  id_trener int not null,
  imie varchar(20) not null,
  nazwisko varchar(20) not null,
  CONSTRAINT trener_pk PRIMARY KEY(id_trener)
  );
CREATE TABLE klub_stadion
(
  id_klub int not null,
  id_trener int not null unique,
  nazwa_klubu varchar(33) not null,
  nazwa_stadionu varchar(33) not null,
  pojemnosc int not null,
  miejscowosc varchar(20) not null,
  CONSTRAINT klub_pk PRIMARY KEY(id_klub),
  CONSTRAINT klub_trener_fk FOREIGN KEY(id_trener)
  REFERENCES trener(id_trener)
  ON DELETE CASCADE ON UPDATE CASCADE
  );
CREATE TABLE pilkarz
( 
  id_zawodnika int PRIMARY KEY,
  id_klub int not null,
  imie varchar(20) not null,
  nazwisko varchar(20) not null,
  pozycja varchar(33) not null,
  rok_uro int not null,
  wzrost int not null,  
  CONSTRAINT pilkarz_fk FOREIGN KEY(id_klub)
  REFERENCES klub_stadion(id_klub)
  ON DELETE CASCADE ON UPDATE CASCADE
  );

CREATE TABLE trofeum
(
  id_trofeum int,
  nazwa varchar(33),
  id_klub int,
  CONSTRAINT trofeum_pk PRIMARY KEY(id_trofeum),
  CONSTRAINT trofeum_fk FOREIGN KEY(id_klub)
  REFERENCES klub_stadion(id_klub)
  ON DELETE CASCADE ON UPDATE CASCADE
  );
CREATE TABLE mecz
(
  id_mecz int PRIMARY KEY,  
  id_klub_gospodarz int not null,
  id_klub_gosc int not null,
  wynik char(8) not null,
  CONSTRAINT mecz_gospodarz_fk FOREIGN KEY(id_klub_gospodarz)
  REFERENCES klub_stadion(id_klub)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT mecz_gosc_fk FOREIGN KEY(id_klub_gosc)
  REFERENCES klub_stadion(id_klub)
  ON DELETE CASCADE ON UPDATE CASCADE
  );

  