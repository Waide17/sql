-- Si vogliono gestire i dati dei clienti e dei relativi conti correnti di una banca. Le entità individuate e i relativi attributi sono: CONTO: ID, Saldo MOVIMENTO: ID, Datam, Causale, Importo CLIENTE: ID, Cognome, Nome, Sesso CITTA: ID, NomeCitta, Cap  Progettare il modello concettuale (diagramma Entity-Relation)  Definire il modello logico  Implementare il modello fisico inserendo i dati contenuti nelle tabelle sottostanti  Realizzare le seguenti query:



-- Elenco clienti con saldo superiore a 50000
-- Elenco clienti di Rubiera
-- Città e CAP del cliente Algeri
-- Visualizzare il saldo di un dato cliente (inserire cognome e nome)
-- Elenco dei clienti (solo cognome e nome) ordinati alfabeticamente per cognome
-- Elenco dei conti con relativo saldo ordinati per saldo dal maggiore al minore
-- Dettaglio operazioni effettuate sul conto con codice 1 visualizzando data, tipo di operazione e importo
-- Elenco di tutti i prelievi (data e importo) sul conto con codice 2
-- Elenco di tutti i versamenti di Buttiglieri (data e importo)
-- Elenco di tutti i movimenti effettuati dal 01/10/2019
-- Elenco di tutti i versamenti effettuati prima del 20/10/2019
-- Elenco di tutti i prelievi effettuati dal 01/10/2019 al 20/10/2019 con importo>100
-- Elencare il cognome e il nome del cliente con tutte le operazioni realizzate nel mese di settembre 2019
-- Elencare tutti i clienti il cui cognome inizia con la lettera B

CREATE DATABASE IF NOT EXISTS banca;
USE banca;

CREATE TABLE CITTA (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCitta VARCHAR(100) NOT NULL,
    Cap CHAR(5) NOT NULL
);

CREATE TABLE CLIENTE (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cognome VARCHAR(100) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Sesso CHAR(1) NOT NULL,
    IDCitta INT NOT NULL,
    CONSTRAINT fk_cliente_citta
        FOREIGN KEY (IDCitta)
        REFERENCES CITTA(ID)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE CONTO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    IDCliente INT NOT NULL,
    CONSTRAINT fk_conto_cliente
        FOREIGN KEY (IDCliente)
        REFERENCES CLIENTE(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE MOVIMENTO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Datam DATE NOT NULL,
    Causale VARCHAR(255) NOT NULL,
    Importo DECIMAL(10,2) NOT NULL,
    IDConto INT NOT NULL,
    CONSTRAINT fk_movimento_conto
        FOREIGN KEY (IDConto)
        REFERENCES CONTO(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Popolare la tabella CITTA
INSERT INTO CITTA (ID, NomeCitta, Cap) VALUES 
(1, 'Reggio Emilia', '42121'),
(2, 'Rubiera', '42048'),
(3, 'Scandiano', '42019'),
(4, 'Correggio', '42015'),
(5, 'Guastalla', '42016'),
(6, 'Castelnovo nei Monti', '42035'),
(7, 'Novellara', '42017');

-- Popolare la tabella CLIENTE
INSERT INTO CLIENTE (ID, Cognome, Nome, Sesso, IDCitta) VALUES 
(1, 'Algeri', 'Anna', 'F', 1),
(2, 'Buttiglieri', 'Mario', 'M', 2),
(3, 'Bianchi', 'Luca', 'M', 3),
(4, 'Verdi', 'Giulia', 'F', 4),
(5, 'Neri', 'Marco', 'M', 5),
(6, 'Gialli', 'Sara', 'F', 6),
(7, 'Blu', 'Paolo', 'M', 7);

-- Popolare la tabella CONTO
INSERT INTO CONTO (ID, Saldo, IDCliente) VALUES 
(1, 1000.00, 1),
(2, 1500.00, 2),
(3, 2000.00, 3),
(4, 2500.00, 4),
(5, 3000.00, 5),
(6, 3500.00, 6),
(7, 4000.00, 7);

-- Popolare la tabella MOVIMENTO
INSERT INTO MOVIMENTO (ID, Datam, Causale, Importo, IDConto) VALUES 
(1, '2019-08-20', 'P', 500.00, 1),
(2, '2019-08-15', 'V', 200.00, 1),
(3, '2019-08-16', 'P', 300.00, 2),
(4, '2019-08-31', 'V', 110.00, 2),
(5, '2019-10-14', 'P', 400.00, 3),
(6, '2019-09-11', 'V', 150.00, 3),
(7, '2019-12-12', 'P', 250.00, 4);

-- Elenco di tutte le città
SELECT NomeCitta
FROM CITTA;

-- Elenco conti correnti con saldo >15000
SELECT *
FROM CONTO
WHERE Saldo>1500;

-- Riepilogo elenco clienti con saldo
