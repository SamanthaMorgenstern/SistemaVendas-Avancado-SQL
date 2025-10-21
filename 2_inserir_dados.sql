INSERT INTO clientes (nome, email, telefone)
VALUES 
  ('Maria Silva', 'maria@gmail.com', '99999-1234'),
  ('João Pereira', 'joao@hotmail.com', '98888-5678');

INSERT INTO categorias_produtos (nome)
VALUES 
  ('Roupas'),
  ('Calçados'),
  ('Acessórios');

INSERT INTO produtos (id_categoria, nome, preco, estoque)
VALUES 
  (1, 'Camiseta', 49.90, 50),
  (1, 'Calça Jeans', 129.90, 30),
  (2, 'Tênis', 199.90, 20),
  (3, 'Boné', 39.90, 15);

INSERT INTO vendas (id_cliente, data_venda, total, desconto, status)
VALUES 
  (1, '2025-10-20', 179.80, 10.00, 'Pago');

INSERT INTO itens_venda (id_venda, id_produto, quantidade, subtotal)
VALUES 
  (1, 1, 2, 99.80),
  (1, 2, 1, 90.00);

INSERT INTO pagamentos (id_venda, tipo_pagamento, valor, data_pagamento)
VALUES 
  (1, 'Cartão de Crédito', 179.80, '2025-10-20');

INSERT INTO estoque_movimentacoes (id_produto, tipo_movimentacao, quantidade, data_movimentacao)
VALUES 
  (1, 'Saída', 2, '2025-10-20'),
  (2, 'Saída', 1, '2025-10-20'),
  (1, 'Entrada', 50, '2025-01-01'),
  (2, 'Entrada', 30, '2025-01-01');