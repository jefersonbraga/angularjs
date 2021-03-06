﻿CREATE TABLE [dbo].[EV_SALALOCALPROVA](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SALA] [varchar](250) NULL,
	[LOCALPROVAID] [int] NULL,
 CONSTRAINT [PK_EV_SALALOCALPROVA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
ALTER TABLE [dbo].[EV_SALALOCALPROVA]  WITH CHECK ADD  CONSTRAINT [FK_EV_SALALOCALPROVA_EV_LOCALPROVA] FOREIGN KEY([LOCALPROVAID])
REFERENCES [dbo].[EV_LOCALPROVA] ([ID])
GO

ALTER TABLE [dbo].[EV_SALALOCALPROVA] CHECK CONSTRAINT [FK_EV_SALALOCALPROVA_EV_LOCALPROVA]