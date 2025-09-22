use lojaCalcados;

SELECT * FROM estoque;

desc categoria;

insert into categoria(nome) values ("sapatênis");

select * from categoria;

desc produto;

insert into produto(nome, id_categorias, id_marca,
descricao)
VALUES ("Sapatênis Caual Puma",5,3, "Sapatênis Caual Puma");

-- ATIVIDADE 1 - Letra b

select * from produto;

desc estoque;

insert into estoque( id_produto, tamanho, cor, quantidade, preco)
values (11, 40, "Cinza", 6, 219.90),
(11, 41, "Preto", 4, 219.90);

select * from estoque;

select * from produto;

UPDATE produto set descricao = "Tênis confortável com design moderno e amortecimento Air" WHERE id= 1; 



SELECT * from estoque order by id_produto;
select * from estoque
where quantidade <10;

select produto.nome, estoque.quantidade from produto join estoque
on produto.id = estoque.id_produto;

select produto.nome, categoria.nome, marca.nome, estoque.preco
from produto join categoria on produto.id_categoria = categoria.id
join marca on produto.id_marca = marca.id
 join estoque on produto.id = estoque.id_produto;

select produto.nome, SUM(estoque.quantidade) "Quantidade Total"
from produto join estoque on produto.id = estoque.id_produto
GROUP BY produto.nome;
