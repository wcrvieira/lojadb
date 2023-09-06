-- Dropa (APAGA) a base de dados 
DROP DATABASE IF EXISTS loja;

--  Criar a base de dados do e-commerce
CREATE DATABASE IF NOT EXISTS loja;

-- Definir como a base padrão
USE loja;

-- Criar a tabela Fornecedores
CREATE TABLE IF NOT EXISTS fornecedores
( cnpj_ec DECIMAL(14) NOT NULL,
  razaosocial_ec VARCHAR(50),
  inscEst_ec DECIMAL(12),
  endereco_ec VARCHAR(60),
  bairro_ec VARCHAR(30),
  cidade_ec VARCHAR(40),
  estado_ec CHAR(2),
  telefone_ec VARCHAR(20),
  email_ec VARCHAR(60),
  site_ec VARCHAR(50),
  PRIMARY KEY(cnpj_ec)
);

-- Inserindo registros da base de fornecedores
INSERT INTO fornecedores VALUES
(35432456000110, 'Indústrias Maldonado Ltda',  123456789123, 'Av. dos Embus, 1000',
 'Parque Industrial', 'Araras', 'SP', '+55 (12) 35689-4587', 'maldonado@maldonado.ind.br',
 'www.maldonado.ind.br'),

 (25789145000111, 'Confecções Brother S/C', 456789456123, 'Rua Capixaba, 25', 
 'Jardim do Céu', 'Belford Roxo', 'RJ', '+55 (21) 49869-8788', 'brother@jmail.com', 
 'www.brother.com.br'),

 (89745478000112, 'Padaria Quimura', 002456321889,
 'Alameda Alair, s/n', 'Centro', 'Capão Redondo', 'SP' , '+55 (11) 32569-8112', 
 'padoca@padoca.org.br', 'www.padocaquimura.org.br');

-- Criar a tabela produtos
CREATE TABLE IF NOT EXISTS produtos
( codProdutos_ec INT(8) NOT NULL,
  descricao_ec VARCHAR(50),
  categoria_ec VARCHAR(30),
  classificacao_ec VARCHAR(20),
  numeracao_ec VARCHAR(10),
  modelo_ec VARCHAR(20),
  cor VARCHAR(10),
  forn_cnpj_ec DECIMAL(14),
  PRIMARY KEY(codProdutos_ec),
  FOREIGN KEY(forn_cnpj_ec) REFERENCES fornecedores(cnpj_ec)
);

-- Inserindo registros de produtos
INSERT INTO produtos VALUES
(11001201, 'Tênis esporte linha Premium', 'Sport Action', 
'64041100', '34 a 42', 'Sport', 'Azul', 25789145000111),

(12001500, 'Tênis Classic Rubro', 'Sport Leavel',
'64041101', '40 a 48', 'Casual', 'Lilás', 89745478000112),

(13011001, 'Tênis Slack Sitt', 'Sport Grael',
'64051202', '38 a 46', 'Sport', 'Black Gray', 89745478000112);

-- Criando a tabela de clientes
CREATE TABLE IF NOT EXISTS clientes 
(
    cpf_ec DECIMAL(11) NOT NULL,
    nome_ec VARCHAR(50),
    rg_ec VARCHAR(20),
    datanasc_ec date,
    endereco_ec VARCHAR(50),
    bairro_ec VARCHAR(30),
    cidade_ec VARCHAR(30),
    estado_ec char(2),
    telefone_ec VARCHAR(20),
    email VARCHAR(50),
    PRIMARY KEY(cpf_ec)
);

-- Inserindo os registros de clientes na base
INSERT INTO clientes VALUES
(44524578945, 'Fulano de Tal', '20456789X', '1999-02-15', 'Rua Florindo Talles, 111', 'Jardim Tamares', 'Brodowski', 
'SP', '+55 (16) 99999-9999', 'fulano.tal@imail.com'),

(32545611245, 'Beltrano da Silva', '194567842', '2002-01-01', 'Alameda Buritis, 99', 'Centro', 'Tamaus', 'RO',
'+55 87 32659-4785', 'silva.beltrano@gg.com.br'),

(23644125587, 'Sicrano de Sá', '10258748X', '2001-12-18', 'Praça da bandeira, 2000', 'Jardim Alegre', 'Amaruanas',
'AM', '+55 (77) 98555-4445', 'sicranosa@boll.com');

-- Criando a tabela de pedidos
CREATE TABLE IF NOT EXISTS pedidos
(
    idPedido_ec INT(8) NOT NULL AUTO_INCREMENT,
    dataPedido_ec DATE,
    horaPedido_ec TIME,
    valorPedido_ec DECIMAL(10,2),
    statusPedido_ec BOOLEAN,
    clienteCpf_ec DECIMAL(11),
    produtoCodigo_ec INT(8),
    PRIMARY KEY(idPedido_ec),
    FOREIGN KEY(clienteCpf_ec) REFERENCES clientes(cpf_ec),
    FOREIGN KEY(produtoCodigo_ec) REFERENCES produtos(codProdutos_ec)
);

-- Inserindo registros na tabela de pedidos
INSERT INTO pedidos VALUES
-- CURRENT_DATE - exibe a data atual
-- CURRENT_TIME - exibe a hora atual
(0, CURRENT_DATE, CURRENT_TIME, 500.00, '1', 23644125587, 12001500),
(0, CURRENT_DATE+1, CURRENT_TIME+10, 1268.99, '0', 44524578945,  13011001),
(0, CURRENT_DATE-2, CURRENT_TIME-20, 3.99, '1', 23644125587, 12001500);

-- Criando a tabela de vendas
CREATE TABLE IF NOT EXISTS vendas
(
    idVendas_ec INT(8) NOT NULL AUTO_INCREMENT,
    dataVendas_ec DATE,
    horaVendas_ec TIME,
    totalVendas_ec DECIMAL(10,2),
    pedidosId_ec INT(8),
    PRIMARY KEY(idVendas_ec),
    FOREIGN KEY(pedidosId_ec) REFERENCES pedidos(idPedido_ec)
);

INSERT INTO vendas VALUES
(0, CURRENT_DATE, CURRENT_TIME, 899.55, 1),
(0, CURRENT_DATE, CURRENT_TIME, 1211.65, 3),
(0, CURRENT_DATE, CURRENT_TIME, 15.55, 2);

