-- Total gasto por cliente
SELECT c.nome, SUM(v.total - v.desconto) AS total_gasto
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.nome;

-- Produtos mais vendidos
SELECT p.nome, SUM(iv.quantidade) AS total_vendido
FROM itens_venda iv
JOIN produtos p ON iv.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY total_vendido DESC;

-- Vendas com detalhes do pagamento e status
SELECT v.id_venda, c.nome, v.data_venda, p.tipo_pagamento, p.valor, v.status
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN pagamentos p ON v.id_venda = p.id_venda;

-- Histórico de movimentação de estoque
SELECT p.nome, em.tipo_movimentacao, em.quantidade, em.data_movimentacao
FROM estoque_movimentacoes em
JOIN produtos p ON em.id_produto = p.id_produto
ORDER BY em.data_movimentacao DESC;