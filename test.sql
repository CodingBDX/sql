-- Active: 1660475214465@@symfony-mysql-1@3306@symfony6
INSERT INTO aliment (`nom`, `marque`, `sucre`, `calories`, `graisses`, `proteines`, `bio`)

VALUES
('orangina', 'monoprix', 127.5, 134, 0.2, 1.1);


SELECT nom, calories FROM aliment;

UPDATE utilisateur SET email = "jeanjaures@gmail.com" WHERE id = 1;


SELECT email from utilisateur WHERE id =1;

UPDATE aliment set nom = "pomme golden" WHERE nom = "pomme";

DELETE FROM utilisateur WHERE id =2;

SELECT nom FROM aliment where `calories` >= 12;

SELECT nom from utilisateur where email LIKE  "%gmail.com";

SELECT nom from utilisateur where email like "%gmail.com" ORDER BY nom ASC;

select COUNT(nom) FROM utilisateur where email LIKE "%gmail.com";

SELECT COUNT(distinct nom) from aliment;

SELECT AVG(calories) from aliment where calories >= 30;

SELECT SUM(graisses) from aliment;

SELECT max(proteines)FROM aliment;

SELECT * from aliment;

CREATE VIEW utilisateur_gmail as SELECT * from utilisateur where email LIKE "%gmail.com";


SELECT * FROM utilisateur_gmail;

SELECT nom FROM utilisateur_gmail where email LIKE "%sa%";  


select * from utilisateur

JOIN langue 

ON `utilisateur`.`langue_id` = `langue`.`id`;


SELECT * FROM utilisateur

JOIN utilisateur_aliment ON (utilisateur_id = utilisateur_aliment.utilisateur_id)

JOIN aliment on (aliment_id = utilisateur_aliment.utilisateur_id);


ALTER Table aliment ADD vitamine_c FLOAT;

alter TABLE langue add code VARCHAR(50);

UPDATE  langue SET code = 'FR-fr' where id =1;

alter table aliment DROP bio;

ALTER Table aliment MODIFY calories FLOAT;

ALTER TABLE utilisateur MODIFY email VARCHAR(500);

alter TABLE aliment change sucre sucres FLOAT;

ALTER table langue change code code_pays VARCHAR(100);

CREATE Table famille(
    id int AUTO_INCREMENT NOT NULL PRIMARY KEY,

    nom VARCHAR(100) NOT NULL
);

SHOW TABLEs;

INSERT into famille(`nom`)

VALUES
('legumes');

alter Table aliment ADD famille_id int not NULL;


ALTER TABLE aliment 
add FOREIGN KEY (famille_id) REFERENCES famille (id)

ON DELETE CASCADE;



SELECT * from aliment;

UPDATE aliment set famille_id = 1 where nom = 'saumon';

select * from aliment
join  famille on aliment.famille_id = famille_id

WHERE
aliment.nom = "saumon";

CREATE table lieu(
    id int AUTO_INCREMENT NOT NULL PRIMARY key,
    nom VARCHAR(100) not NULL,
    type VARCHAR(100) not null
);

INSERT into lieu(`nom`, `type`)
VALUES
('carrefour city', 'supermarche');


CREATE TABLE aliment_lieu (

aliment_id INT NOT NULL,

lieu_id INT NOT NULL,

FOREIGN KEY (aliment_id) REFERENCES aliment (id) ON DELETE RESTRICT ON UPDATE CASCADE,

FOREIGN KEY (lieu_id) REFERENCES lieu (id) ON DELETE RESTRICT ON UPDATE CASCADE,

PRIMARY KEY (aliment_id, lieu_id)

);

INSERT INTO `aliment_lieu` (`aliment_id`, `lieu_id`) VALUES ('11', '1');


SELECT * FROM aliment

JOIN aliment_lieu on aliment_id = aliment_lieu.aliment_id
JOIN lieu on lieu_id = aliment_lieu.aliment_id

where aliment_id = 11;