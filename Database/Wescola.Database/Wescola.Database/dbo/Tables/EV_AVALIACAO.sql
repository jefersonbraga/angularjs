﻿CREATE TABLE [dbo].[EV_AVALIACAO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITULO] [varchar](250) NOT NULL,
	[DESCRICAO] [varchar](max) NULL,
	[EVENTOID] [int] NOT NULL,
	[DISPONIVEL] [varchar](5) NULL,
	[DTINICIO] [datetime] NULL,
	[HORAINICIO] [time](7) NULL,
	[DTTERMINO] [datetime] NULL,
	[HORATERMINO] [time](7) NULL,
	[DTCADASTRO] [datetime] NOT NULL,
	[DTALTERACAO] [datetime] NOT NULL,
	[DTEXCLUSAO] [datetime] NULL,
 CONSTRAINT [PK_EV_AVALIACAO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
ALTER TABLE [dbo].[EV_AVALIACAO]  WITH CHECK ADD  CONSTRAINT [FK_EV_AVALIACAO_EV_EVENTO] FOREIGN KEY([EVENTOID])
REFERENCES [dbo].[EV_EVENTO] ([ID])
GO

ALTER TABLE [dbo].[EV_AVALIACAO] CHECK CONSTRAINT [FK_EV_AVALIACAO_EV_EVENTO]