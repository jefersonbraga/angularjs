﻿CREATE TABLE [dbo].[EV_LOCALEVENTO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](200) NOT NULL,
	[DTCADASTRO] [datetime] NOT NULL,
	[DTATUALIZACAO] [datetime] NOT NULL,
	[DTEXCLUSAO] [datetime] NULL,
 CONSTRAINT [PK_EV_LOCALEVENTO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
ALTER TABLE [dbo].[EV_LOCALEVENTO] ADD  CONSTRAINT [DF_EV_LOCALEVENTO_DTATUALIZACAO]  DEFAULT (getdate()) FOR [DTATUALIZACAO]
GO
ALTER TABLE [dbo].[EV_LOCALEVENTO] ADD  CONSTRAINT [DF_EV_LOCALEVENTO_DTCADASTRO]  DEFAULT (getdate()) FOR [DTCADASTRO]