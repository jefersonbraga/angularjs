﻿CREATE TABLE [dbo].[EV_LOCALPROVA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LOCAL] [varchar](255) NOT NULL,
	[CEP] [varchar](50) NOT NULL,
	[LOGRADOURO] [varchar](250) NOT NULL,
	[ENDERECO] [varchar](250) NOT NULL,
	[BAIRRO] [varchar](250) NOT NULL,
	[COMPLEMENTO] [varchar](250) NULL,
	[NUMERO] [int] NULL,
	[CIDADE] [varchar](250) NOT NULL,
	[ESTADO] [varchar](2) NOT NULL,
 CONSTRAINT [PK_EV_LOCALPROVA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

