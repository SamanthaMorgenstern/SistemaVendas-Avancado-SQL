CREATE DATABASE sistema_vendas;
USE sistema_vendas;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE categorias_produtos (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_categoria INT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    FOREIGN KEY (id_categoria) REFERENCES categorias_produtos(id_categoria)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_venda DATE NOT NULL,
    total DECIMAL(10,2),
    desconto DECIMAL(10,2) DEFAULT 0,
    status ENUM('Pendente', 'Pago', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    tipo_pagamento VARCHAR(50),
    valor DECIMAL(10,2),
    data_pagamento DATE,
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda)
);

CREATE TABLE estoque_movimentacoes (
    id_movimentacao INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    tipo_movimentacao ENUM('Entrada', 'Saída'),
    quantidade INT,
    data_movimentacao DATE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);