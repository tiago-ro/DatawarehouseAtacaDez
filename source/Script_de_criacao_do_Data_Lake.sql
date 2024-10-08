USE [DL_ATACADEZ]
GO
/****** Object:  Table [dbo].[tbl_tempo]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_tempo]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_tempo]
GO
/****** Object:  Table [dbo].[tbl_produto]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_produto]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_produto]
GO
/****** Object:  Table [dbo].[tbl_nota]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_nota]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_nota]
GO
/****** Object:  Table [dbo].[tbl_log]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_log]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_log]
GO
/****** Object:  Table [dbo].[tbl_item]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_item]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_item]
GO
/****** Object:  Table [dbo].[tbl_empresa]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_empresa]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_empresa]
GO
/****** Object:  Table [dbo].[tbl_compra]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_compra]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_compra]
GO
/****** Object:  Table [dbo].[tbl_cliente]    Script Date: 27/08/2024 14:40:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_cliente]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_cliente]
GO
/****** Object:  Table [dbo].[tbl_cliente]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cliente](
	[cod_cliente] [varchar](25) NOT NULL,
	[desc_cliente] [varchar](200) NULL,
	[endereco] [varchar](200) NULL,
	[faturamento] [float] NULL,
	[desc_segmento] [varchar](200) NULL,
	[desc_cidade] [varchar](200) NULL,
	[cod_estado] [varchar](25) NULL,
	[desc_estado] [varchar](200) NULL,
	[desc_regiao] [varchar](200) NULL,
	[arquivo_origem] [varchar](200) NULL,
	[data_carga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_compra]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_compra](
	[mes_ano] [varchar](25) NOT NULL,
	[cod_produto] [varchar](25) NOT NULL,
	[preco_copras] [float] NULL,
	[arquivo_origem] [varchar](200) NULL,
	[data_carga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_produto] ASC,
	[mes_ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_empresa]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_empresa](
	[cod_loja] [varchar](25) NOT NULL,
	[desc_loja] [varchar](200) NULL,
	[desc_empresa] [varchar](200) NULL,
	[cod_empresa] [varchar](25) NULL,
	[tamanho_loja] [float] NULL,
	[arquivo_origem] [varchar](200) NULL,
	[data_carga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_loja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_item]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_item](
	[numero] [int] NOT NULL,
	[cod_produto] [varchar](25) NOT NULL,
	[quantidade] [float] NULL,
	[preco] [float] NULL,
	[arquivo_origem] [varchar](200) NULL,
	[data_carga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_produto] ASC,
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_log]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_log](
	[data] [datetime] NOT NULL,
	[mensagem] [varchar](255) NULL,
	[resultado] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[data] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_nota]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_nota](
	[numero] [int] NOT NULL,
	[cod_cliente] [varchar](25) NULL,
	[data] [date] NULL,
	[cod_loja] [varchar](25) NULL,
	[arquivo_origem] [varchar](200) NULL,
	[data_carga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_produto]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_produto](
	[cod_produto] [varchar](25) NOT NULL,
	[desc_produto] [varchar](200) NULL,
	[desc_departamento] [varchar](200) NULL,
	[atr_unidade_medida] [varchar](50) NULL,
	[cod_fornecedor] [varchar](25) NULL,
	[desc_fornecedor] [varchar](200) NULL,
	[arquivo_origem] [varchar](200) NULL,
	[data_carga] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_tempo]    Script Date: 27/08/2024 14:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tempo](
	[cod_dia] [varchar](25) NOT NULL,
	[data] [date] NULL,
	[controle] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
