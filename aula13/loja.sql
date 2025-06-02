CREATE DATABASE if not exists loja;

use loja;
-- Tabela de categorias
CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de marcas
CREATE TABLE marca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de produtos
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_categoria INT,
    id_marca INT,
    descricao TEXT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_marca) REFERENCES marca(id)
);

-- Tabela de estoque (relacionada a produto)
CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    tamanho VARCHAR(5),
    cor VARCHAR(30),
    preco DECIMAL(10,2),
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id)
);

-- INSERINDO DADOS

-- Inserir categorias
INSERT INTO categoria (nome) VALUES 
('Tênis'), ('Sandália'), ('Bota'), ('Chinelo');

-- Inserir marcas
INSERT INTO marca (nome) VALUES 
('Nike'), ('Adidas'), ('Puma'), ('Havaianas'), ('Timberland');

-- Inserir produtos (10 produtos variados)
INSERT INTO produto (nome, id_categoria, id_marca, descricao) VALUES
('Tênis Nike Air Max', 1, 1, 'Confortável e esportivo'),
('Chinelo Havaianas Slim', 4, 4, 'Modelo feminino com tiras finas'),
('Sandália Adidas Comfort', 2, 2, 'Palmilha anatômica'),
('Bota Timberland Couro', 3, 5, 'Ideal para trilhas e frio'),
('Tênis Puma Runner', 1, 3, 'Modelo leve para corrida'),
('Sandália Nike Solarsoft', 2, 1, 'Para uso casual'),
('Tênis Adidas Street', 1, 2, 'Design urbano'),
('Bota Nike Adventure', 3, 1, 'Robusta e resistente'),
('Chinelo Puma Relax', 4, 3, 'Confortável para o dia a dia'),
('Sandália Havaianas Flat', 2, 4, 'Moderna e colorida');

-- Inserir estoque (amostra com tamanhos, cores, preços e quantidades)
INSERT INTO estoque (id_produto, tamanho, cor, preco, quantidade) VALUES
(1, '42', 'Preto', 399.90, 10),
(2, '38', 'Rosa', 49.90, 25),
(3, '40', 'Azul', 129.90, 15),
(4, '43', 'Marrom', 499.90, 5),
(5, '41', 'Cinza', 199.90, 8),
(6, '39', 'Preto', 99.90, 12),
(7, '42', 'Branco', 299.90, 6),
(8, '44', 'Preto', 449.90, 4),
(9, '40', 'Azul', 59.90, 18),
(10, '37', 'Vermelho', 69.90, 20);


