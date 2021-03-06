﻿CREATE TABLE [dbo].[EV_AVALIACAOPERGUNTA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AVALIACAOID] [int] NOT NULL,
	[TITULO] [varchar](100) NOT NULL,
	[ORDEM] [int] NOT NULL,
	[DTCADASTRO] [datetime] NOT NULL,
	[DTATUALIZACAO] [datetime] NOT NULL,
	[DTEXCLUSAO] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

