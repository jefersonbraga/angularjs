﻿CREATE TABLE [dbo].[EV_NECESSIDADE](
	[ID] [int] NOT NULL,
	[NECESSIDADE] [varchar](250) NULL,
	[TIPONECESSIDADEID] [int] NULL,
	[DTCADASTRO] [datetime] NOT NULL,
	[DTATUALIZACAO] [datetime] NOT NULL,
	[DTEXCLUSAO] [datetime] NULL,
 CONSTRAINT [PK_EV_NECESSIDADE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
ALTER TABLE [dbo].[EV_NECESSIDADE]  WITH CHECK ADD  CONSTRAINT [FK_EV_NECESSIDADE_EV_TPNECESSIDADE] FOREIGN KEY([TIPONECESSIDADEID])
REFERENCES [dbo].[EV_TPNECESSIDADE] ([ID])
GO

ALTER TABLE [dbo].[EV_NECESSIDADE] CHECK CONSTRAINT [FK_EV_NECESSIDADE_EV_TPNECESSIDADE]