CREATE TABLE [dbo].[tbl_compra]
(
	[mes_ano] VARCHAR(25) NOT NULL , 
    [cod_produto] VARCHAR(25) NOT NULL, 
    [preco_copras] FLOAT NULL, 
    [arquivo_origem] VARCHAR(200) NULL, 
    [data_carga] DATETIME NULL, 
    PRIMARY KEY ([cod_produto], [mes_ano])
)
