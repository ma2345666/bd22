-- atividade letra a

INSERT INTO categoria (nome) VALUES ("Sapatênis");

-- Verificar a categoria e a marca
SELECT * FROM categoria;
SELECT * FROM marca;

-- Inserir produto "Sapatênis Casual Puma"
INSERT INTO produto (nome, id_categoria, id_marca, descricao)
VALUES ("Sapatênis Casual Puma", 5, 3, "Sapatênis Casual Puma");


 -- atividade letra b
 -- Inserir variações de estoque para o produto "Sapatênis Casual Puma"
INSERT INTO estoque (id_produto, tamanho, cor, quantidade, preco)
VALUES 
  ((SELECT id FROM produto WHERE nome = "Sapatênis Casual Puma"), 40, 'Cinza', 6, 219.90),
  ((SELECT id FROM produto WHERE nome = "Sapatênis Casual Puma"), 41, 'Preto', 4, 219.90);

-- letra C
SELECT produto.nome, estoque.quantidade
FROM produto
JOIN estoque ON produto.id = estoque.id_produto
WHERE estoque.quantidade < 10;

  
  -- atividade 2
 -- Atualizar descrição do produto "Tênis Nike Air Max"
UPDATE produto
SET descricao = "Tênis confortável com design moderno e amortecimento Air"
WHERE nome = "Tênis Nike Air Max";


  
  -- atividade 3 a
-- Consultar todos os produtos com seus preços
SELECT produto.nome, estoque.preco
FROM produto
JOIN estoque ON produto.id = estoque.id_produto;

 
 -- 3b
-- Consultar nomes e quantidades de variações de estoque
SELECT produto.nome, estoque.quantidade
FROM produto
JOIN estoque ON produto.id = estoque.id_produto;

 
 -- 3c
 -- Consultar produtos com estoque menor que 10
-- Consultar produtos com estoque menor que 10
SELECT produto.nome, estoque.quantidade
FROM produto
JOIN estoque ON produto.id = estoque.id_produto
WHERE estoque.quantidade < 10;

    
    -- 4 a
    -- Consultar todos os produtos com suas categorias e marcas
-- Consultar todos os produtos com suas categorias e marcas
SELECT produto.nome, categoria.nome AS categoria, marca.nome AS marca, estoque.preco
FROM produto
JOIN categoria ON produto.id_categoria = categoria.id
JOIN marca ON produto.id_marca = marca.id
JOIN estoque ON produto.id = estoque.id_produto;

-- 4 b
-- Consultar nome do produto, cor, tamanho e quantidade do estoque
SELECT produto.nome, estoque.cor, estoque.tamanho, estoque.quantidade
FROM produto
JOIN estoque ON produto.id = estoque.id_produto;


-- 5 a
-- Total de pares de calçados disponíveis em estoque
SELECT SUM(estoque.quantidade) AS total_pares
FROM estoque;


-- 5 b
-- Quantidade total de pares por produto
SELECT produto.nome, SUM(estoque.quantidade) AS total_pares
FROM produto
JOIN estoque ON produto.id = estoque.id_produto
GROUP BY produto.nome;

 
 -- 5c
-- Calcular valor total em estoque por produto
SELECT produto.nome, SUM(estoque.quantidade * estoque.preco) AS valor_total
FROM produto
JOIN estoque ON produto.id = estoque.id_produto
GROUP BY produto.nome;

-- 5 d
-- Calcular a média de preço dos produtos por categoria
SELECT categoria.nome AS categoria, AVG(estoque.preco) AS media_preco
FROM produto
JOIN categoria ON produto.id_categoria = categoria.id
JOIN estoque ON produto.id = estoque.id_produto
GROUP BY categoria.nome;
