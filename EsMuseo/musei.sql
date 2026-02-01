CREATE DATABASE IF NOT EXISTS museo;
USE museo;
-- CITTA: id, nome, nazione
-- MUSEI: id, denominazione

CREATE TABLE IF NOT EXISTS CITTA (
    id CHAR(3) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nazione VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS MUSEO (
    id CHAR(3) PRIMARY KEY,
    denominazione VARCHAR(100) NOT NULL,
    citta_id CHAR(3),
    FOREIGN KEY (citta_id) REFERENCES CITTA(id)
);

--popolo le tabelle con questi elementi CITTÁ: 
--c1, Firenze, Italia
-- c2, Roma, Italia
-- c3, Ferrara, Italia
-- c4, Barcellona, Spagna

INSERT INTO CITTA
VALUES
('c1', 'Firenze', 'Italia'),
('c2', 'Roma', 'Italia'),
('c3', 'Ferrara', 'Italia'),
('c4', 'Barcellona', 'Spagna');

--popolo musei MUSEI: m1, Galleria Uffizi
-- m2, Musei Civici di Arte Antica
-- m3, Musei Vaticani
-- m4, La Pedrera
-- m5, Galleria Borghese

INSERT INTO MUSEO
VALUES
('m1', 'Galleria Uffizi', 'c1'),
('m2', 'Musei Civici di Arte Antica', 'c1'),
('m3', 'Musei Vaticani', 'c2'),
('m4', 'La Pedrera', 'c4'),
('m5', 'Galleria Borghese', 'c2');

--visualizzo tutte le citta
SELECT c.nome
FROM CITTA c;

SELECT c.nome
FROM CITTA c
WHERE c.nazione = 'Italia';

--Visualizzare le città che iniziano con la lettera “F”
SELECT c.nome
FROM CITTA c
WHERE c.nome LIKE 'F%';

--Contare tutte le città
SELECT COUNT(*) FROM CITTA;

--Contare tutte le città italiane.
SELECT COUNT(*) FROM CITTA c WHERE c.nazione = 'Italia';

--Visualizzare i musei presenti a Barcellona.
SELECT m.denominazione
FROM MUSEO m
JOIN CITTA c ON m.citta_id = c.id
WHERE c.nome = 'Barcellona';

--Conoscere l’elenco dei musei di Roma ordinato in modo crescente.
SELECT m.denominazione
FROM MUSEO m
JOIN CITTA c ON m.citta_id = c.id
WHERE c.nome = 'Roma'
ORDER BY m.denominazione ASC;

-- Visualizzare tutte le città che non risiedono nel territorio italiano
SELECT c.nome
FROM CITTA c
WHERE c.nazione <> 'Italia';