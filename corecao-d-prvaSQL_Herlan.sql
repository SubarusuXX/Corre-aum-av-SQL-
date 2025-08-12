

-----------------------  N1  -----------------------------
CREATE DATABASE HOTEL;

USE HOTEL;

CREATE TABLE quartos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR (255),
    capacidade INT,
    vista_mar BOOLEAN NOT NULL,
    diaria DECIMAL (9,2)
);

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (255),
    email VARCHAR (255),
    telefone VARCHAR(20),
    tabela VARCHAR(255)
);

CREATE TABLE reservas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    quarto_id INT NOT NULL,
    data_entrada DATE,
    data_saida DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (quarto_id) REFERENCES quartos(id)
);
-----------------------------------  N2  -------------------------------

-- QUARTOS --

INSERT INTO quartos (numero, capacidade, vista_mar, diaria)
VALUES('QUARTO1',1,FALSE,150.00);

INSERT INTO quartos (numero, capacidade, vista_mar, diaria)
VALUES('QUARTO2',5,TRUE,750.00);

INSERT INTO quartos (numero, capacidade, vista_mar, diaria)
VALUES('QUARTO3',3,TRUE,450.00);

INSERT INTO quartos (numero, capacidade, vista_mar, diaria)
VALUES('QUARTO4',1,FALSE,150.00);

INSERT INTO quartos (numero, capacidade, vista_mar, diaria)
VALUES('QUARTO5',2,FALSE,300.00);

-- CLIENTES --

INSERT INTO clientes (nome, email, telefone)
VALUES (
    'Miguel',
    'miguel@teste.com',
    '(46) 9 2520-3616'
);

INSERT INTO clientes (nome, email, telefone)
VALUES (
    'Alice',
    'alice@teste.com',
    '(46) 9 3582-3775'
);
INSERT INTO clientes (nome, email, telefone)
VALUES (
    'Davi',
    'davi@teste.com',
    '(46) 9 2232-1677'
);
INSERT INTO clientes (nome, email, telefone)
VALUES (
    'Julia',
    'julia@teste.com',
    '(46) 9 3712-5526'
);
INSERT INTO clientes (nome, email, telefone)
VALUES (
    'Bruna',
    'bruna@teste.com',
    '(46) 9 2515-0737'
);


-- RESERVAS --

INSERT INTO reservas (cliente_id, quarto_id, data_entrada, data_saida)
VALUES (3,1,'2023-05-01','2023-05-02');

INSERT INTO reservas (cliente_id, quarto_id, data_entrada, data_saida)
VALUES (5,2,'2023-05-06','2023-05-07');

INSERT INTO reservas (cliente_id, quarto_id, data_entrada, data_saida)
VALUES (2,3,'2023-04-14','2023-04-25');

INSERT INTO reservas (cliente_id, quarto_id, data_entrada, data_saida)
VALUES (1,4,'2023-01-01','2023-01-05');

INSERT INTO reservas (cliente_id, quarto_id, data_entrada, data_saida)
VALUES (3,5,'2023-02-20','2023-02-24');

--------------------------------- N3 ---------------------------------

-- A --
SELECT *
FROM quartos
WHERE vista_mar = 1;

-- B --
SELECT 
    clientes.nome,
    clientes.email
FROM clientes;

-- C --
SELECT * 
FROM quartos
WHERE capacidade > 2;

-- D --
SELECT
    clientes.nome
    FROM
    clientes
    WHERE
    clientes.nome LIKE 'b%';

-- E --
Na


--------------------------------N4-----------------------------------

-- A --
SELECT
 quartos
    COUNT (*)
    FROM quartos;

-- B --
SELECT
 quartos,
    COUNT (numero)
    FROM quartos;
-- C --

-- D --
SELECT
AVG (capacidade)
FROM 
    quartos;

-- E --
SELECT
quartos,
COUNT(*)
FROM 
    vista_mar;



--------------------------------N5-----------------------------------

-- A --
SELECT quartos.id
ORDER BY quartos.diaria DESC;
-- B --

-- C --

-- D --

-- E --



--------------------------------N6-----------------------------------

-- A -- 
ALTER TABLE reservas
ADD COLUMN cupom VARCHAR(5);

-- B --

UPDATE reservas SET id = 1 WHERE cupom = 'LGTSP';
UPDATE reservas SET id = 2 WHERE cupom = 'XGTSP';
UPDATE reservas SET id = 4 WHERE cupom = 'GTSQL';


--------------------------------N7-----------------------------------
SELECT*
FROM reservas
JOIN clientes ON reservas.cliente_id = cliente_id
where 
    clientes.id;



SELECT 
reservas.id,
clientes.nome
FROM reservas
JOIN clientes ON reservas.cliente_id = clientes.id;
--------------------------------N8-----------------------------------
SELECT 
reservas.id,
quartos.numero
FROM reservas
JOIN quartos ON reservas.quarto_id = quartos.id;

SELECT*
FROM reservas
JOIN quartos ON reservas.cliente_id = quarto_id
where 
    quartos.id;
--------------------------------N9-----------------------------------
DELETE FROM reservas WHERE id = 4;
DELETE FROM reservas WHERE id = 3;
--------------------------------N10-----------------------------------
-- A --
DROP table reservas;
-- B --
DROP table clientes;
-- C --
DROP table quartos
-- D --
DROP DATABASE hotel;
