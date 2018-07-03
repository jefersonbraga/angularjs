﻿CREATE TABLE [escola].[ES_LISTAATIVIDADES](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[USUARIOID] [nvarchar](128) NOT NULL,
	[DESCRICAO] [varchar](250) NOT NULL,
	[STATUS] [bit] NOT NULL,
	[DT_CRIACAO] [datetime] NOT NULL,
	[DT_ATUALIZACAO] [datetime] NOT NULL,
	[DT_EXCLUSAO] [datetime] NULL,
 CONSTRAINT [PK_ES_LISTAATIVIDADES] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
ALTER TABLE [escola].[ES_LISTAATIVIDADES]  WITH CHECK ADD  CONSTRAINT [FK_ES_LISTAATIVIDADES_AspNetUsers] FOREIGN KEY([USUARIOID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [escola].[ES_LISTAATIVIDADES] CHECK CONSTRAINT [FK_ES_LISTAATIVIDADES_AspNetUsers]