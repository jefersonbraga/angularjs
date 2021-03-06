﻿CREATE TABLE [escola].[ES_DEPENDENCIAADMINISTRATIVA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](50) NOT NULL,
	[DTCADASTRO] [datetime] NOT NULL,
	[DTATUALIZACAO] [datetime] NOT NULL,
	[DTEXCLUSAO] [datetime] NULL,
 CONSTRAINT [PK_ES_DEPENDENCIAADMINISTRATIVA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
ALTER TABLE [escola].[ES_DEPENDENCIAADMINISTRATIVA] ADD  CONSTRAINT [DF_ES_DEPENDENCIAADMINISTRATIVA_DTATUALIZACAO]  DEFAULT (getdate()) FOR [DTATUALIZACAO]
GO
ALTER TABLE [escola].[ES_DEPENDENCIAADMINISTRATIVA] ADD  CONSTRAINT [DF_ES_DEPENDENCIAADMINISTRATIVA_DTCADASTRO]  DEFAULT (getdate()) FOR [DTCADASTRO]