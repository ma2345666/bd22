DELIMITER $$

CREATE PROCEDURE produtoPorQuantidade(IN marca_nome VARCHAR(255), IN qtde INT)
BEGIN
    SELECT 
        produto.nome,
        produto.descricao,
        estoque.tamanho,
        estoque.cor,
        estoque.preco,
        estoque.quantidade
    FROM produto
    JOIN estoque ON produto.id = estoque.id_produto
    WHERE produto.marca = marca_nome
    AND estoque.quantidade <= qtde
    ORDER BY produto.nome;
END $$

DELIMITER ;

-- Para chamar o procedimento:
CALL produtoPorQuantidade('MarcaX', 6);
