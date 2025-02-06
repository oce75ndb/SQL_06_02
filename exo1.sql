CREATE DATABASE bdd06022025;
USE bdd06022025;

-- Création table élèves --

CREATE TABLE eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE NOT NULL,
    email VARCHAR(100) UNIQUE,
    telephone VARCHAR(20),
    classe VARCHAR(10) NOT NULL
);

-- Création table notes --

CREATE TABLE notes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    eleve_id INT NOT NULL,
    matiere VARCHAR(50) NOT NULL,
    note DECIMAL(5,2) NOT NULL CHECK (note BETWEEN 0 AND 21),
    FOREIGN KEY (eleve_id) REFERENCES eleves(id)
);

-- Ajout de 10 élèves --

INSERT INTO eleves (nom, prenom, date_naissance, email, telephone, classe)
VALUES 
('Dupont', 'Marie', '2005-04-12', 'marie.dupont@email.com', '0612345678', 'BTS SIO'),
('Lemoine', 'Lucas', '2004-09-30', 'lucas.lemoine@email.com', '0698765432', 'BTS SIO'),
('Martin', 'Camille', '2006-01-22', 'camille.martin@email.com', '0678901234', 'BTS SIO'),
('Bernard', 'Thomas', '2005-07-15', 'thomas.bernard@email.com', '0687654321', 'BTS CG'),
('Moreau', 'Sophie', '2006-05-18', 'sophie.moreau@email.com', '0671123456', 'BTS CG'),
('Roux', 'Antoine', '2005-02-25', 'antoine.roux@email.com', '0654321987', 'BTS SIO'),
('Fournier', 'Emma', '2006-03-30', 'emma.fournier@email.com', '0643219876', 'BTS CG'),
('Girard', 'Hugo', '2005-11-10', 'hugo.girard@email.com', '0623456789', 'BTS SIO'),
('Bertrand', 'Laura', '2006-08-05', 'laura.bertrand@email.com', '0611223344', 'BTS CG'),
('Lefevre', 'Maxime', '2005-06-20', 'maxime.lefevre@email.com', '0609876543', 'BTS SIO');

-- Ajout de 30 notes --

INSERT INTO notes (eleve_id, matiere, note)
VALUES 
-- Notes pour Marie Dupont (id 1)
(1, 'Mathématiques', 15.5),
(1, 'Informatique', 17),
(1, 'Anglais', 12),

-- Notes pour Lucas Lemoine (id 2)
(2, 'Mathématiques', 14),
(2, 'Informatique', 16),
(2, 'Anglais', 13),

-- Notes pour Camille Martin (id 3)
(3, 'Mathématiques', 18),
(3, 'Informatique', 15),
(3, 'Anglais', 14),

-- Notes pour Thomas Bernard (id 4)
(4, 'Mathématiques', 10),
(4, 'Informatique', 12),
(4, 'Anglais', 15),

-- Notes pour Sophie Moreau (id 5)
(5, 'Mathématiques', 13),
(5, 'Informatique', 14),
(5, 'Anglais', 16),

-- Notes pour Antoine Roux (id 6)
(6, 'Mathématiques', 19),
(6, 'Informatique', 17),
(6, 'Anglais', 15),

-- Notes pour Emma Fournier (id 7)
(7, 'Mathématiques', 11),
(7, 'Informatique', 10),
(7, 'Anglais', 12),

-- Notes pour Hugo Girard (id 8)
(8, 'Mathématiques', 14),
(8, 'Informatique', 16),
(8, 'Anglais', 13),

-- Notes pour Laura Bertrand (id 9)
(9, 'Mathématiques', 15),
(9, 'Informatique', 18),
(9, 'Anglais', 17),

-- Notes pour Maxime Lefevre (id 10)
(10, 'Mathématiques', 16),
(10, 'Informatique', 14),
(10, 'Anglais', 12);

-- Tri élèves --
SELECT * FROM eleves
ORDER BY nom ASC;

-- Création vue (à revoir) --
CREATE VIEW vue_eleves_notes AS
SELECT 
    e.id AS eleve_id,
    e.nom,
    e.prenom,
    e.classe,
    n.matiere,
    n.note
FROM eleves e
LEFT JOIN notes n ON e.id = n.eleve_id
ORDER BY e.nom, e.prenom, n.matiere;

-- Affichage vue --

SELECT * FROM vue_eleves_notes;

-- Affichage des élèves ayant plus de 20 ans --

SELECT COUNT(*) FROM eleves WHERE YEAR(CURDATE()) - YEAR(date_naissance) >= 20;

-- Moyenne des notes par matière --

SELECT matiere, SUM(note) / COUNT(note) AS moyennne FROM notes GROUP BY matiere;

-- Création d'un utilisateur --

CREATE USER 'jean-pierre'@'localhost' IDENTIFIED BY '123456789';

-- Création des droits --

GRANT SELECT ON bdd06022025.vue_eleves_notes TO 'jean-pierre'@'localhost';

-- Création d'un utilisateur admin --

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123456789';

