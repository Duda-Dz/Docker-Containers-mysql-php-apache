CREATE DATABASE dadosempresa;
USE dadosempresa;

CREATE TABLE users (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(100),
    Email varchar(100),
    Endereco varchar(150),
    Cidade varchar(100),
    Produto varchar(50),
    Host varchar(50)
);

INSERT INTO users (ClienteID, name, email, endereço, cidade, produto VALUES ('1', 'Julian Rodrigues', juliamrodrigues2235@gmail.com', 'QR 417, CONJUNTO H', 'BRASILIA-DF', 'Pote da Felicidade');
 
