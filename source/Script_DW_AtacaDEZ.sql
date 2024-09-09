
CREATE TABLE dbo.dim_tempo (
                id_dia INT IDENTITY NOT NULL,
                cod_dia VARCHAR(25) NOT NULL,
                data DATETIME NOT NULL,
                atr_dia_semana VARCHAR(50) NOT NULL,
                atr_fim_de_semana BOOLEAN NOT NULL,
                cod_mes VARCHAR(25) NOT NULL,
                desc_mes VARCHAR(200) NOT NULL,
                cod_trimestre VARCHAR(25) NOT NULL,
                desc_trimestre VARCHAR(200) NOT NULL,
                cod_semestre VARCHAR(25) NOT NULL,
                desc_semestre VARCHAR(200) NOT NULL,
                cod_ano VARCHAR(25) NOT NULL,
                CONSTRAINT dim_tempo_pk PRIMARY KEY (id_dia)
)

CREATE TABLE dbo.dim_departamento (
                cod_setor VARCHAR(25) NOT NULL,
                desc_setor VARCHAR(200) NOT NULL,
                CONSTRAINT dim_departamento_pk PRIMARY KEY (cod_setor)
)

CREATE TABLE dbo.dim_fornecedor (
                cod_fornecedor VARCHAR(25) NOT NULL,
                desc_fornecedor VARCHAR(200) NOT NULL,
                CONSTRAINT dim_fornecedor_pk PRIMARY KEY (cod_fornecedor)
)

CREATE TABLE dbo.dim_produto (
                id_produto INT IDENTITY NOT NULL,
                cod_produto VARCHAR(25) NOT NULL,
                desc_produto VARCHAR(200) NOT NULL,
                atr_unidade_medida VARCHAR(50) NOT NULL,
                cod_fornecedor VARCHAR(25) NOT NULL,
                cod_setor VARCHAR(25) NOT NULL,
                CONSTRAINT dim_produto_pk PRIMARY KEY (id_produto)
)

CREATE TABLE dbo.dim_cliente (
                id_cliente INT IDENTITY NOT NULL,
                cod_cliente VARCHAR(25) NOT NULL,
                desc_cliente VARCHAR(200) NOT NULL,
                atr_tamanho_cliente VARCHAR(25) NOT NULL,
                cod_cidade VARCHAR(25) NOT NULL,
                desc_cidade VARCHAR(200) NOT NULL,
                cod_estado VARCHAR(25) NOT NULL,
                desc_estado VARCHAR(200) NOT NULL,
                cod_regiao VARCHAR(25) NOT NULL,
                des_regiao VARCHAR(200) NOT NULL,
                cod_segmento VARCHAR(25) NOT NULL,
                desc_segmento VARCHAR(200) NOT NULL,
                CONSTRAINT dim_cliente_pk PRIMARY KEY (id_cliente)
)

CREATE TABLE dbo.dim_empresa (
                id_loja INT IDENTITY NOT NULL,
                cod_loja VARCHAR(25) NOT NULL,
                desc_loja VARCHAR(200) NOT NULL,
                atr_tipo_loja VARCHAR(50) NOT NULL,
                cod_empresa VARCHAR(25) NOT NULL,
                desc_empresa VARCHAR(200) NOT NULL,
                CONSTRAINT dim_empresa_pk PRIMARY KEY (id_loja)
)

CREATE TABLE dbo.fact_venda (
                id_loja INT NOT NULL,
                id_cliente INT NOT NULL,
                id_produto INT NOT NULL,
                id_dia INT NOT NULL,
                quantidade_vendida REAL NOT NULL,
                valor_venda REAL NOT NULL,
                custo_venda REAL NOT NULL,
                CONSTRAINT fact_venda_pk PRIMARY KEY (id_loja, id_cliente, id_produto, id_dia)
)

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_tempo_fact_venda_fk
FOREIGN KEY (id_dia)
REFERENCES dbo.dim_tempo (id_dia)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE dbo.dim_produto ADD CONSTRAINT dim_departamento_dim_produto_fk
FOREIGN KEY (cod_setor)
REFERENCES dbo.dim_departamento (cod_setor)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE dbo.dim_produto ADD CONSTRAINT dim_produto_fornecedor_dim_produto_fk
FOREIGN KEY (cod_fornecedor)
REFERENCES dbo.dim_fornecedor (cod_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_produto_fact_venda_fk
FOREIGN KEY (id_produto)
REFERENCES dbo.dim_produto (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_cliente_fact_venda_fk
FOREIGN KEY (id_cliente)
REFERENCES dbo.dim_cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE dbo.fact_venda ADD CONSTRAINT dim_empresa_fact_venda_fk
FOREIGN KEY (id_loja)
REFERENCES dbo.dim_empresa (id_loja)
ON DELETE NO ACTION
ON UPDATE NO ACTION
