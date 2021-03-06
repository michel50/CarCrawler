SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateIn] [datetime2](7) NOT NULL,
	[Link] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
	[Make] [nvarchar](255) NULL,
	[Model] [nvarchar](255) NULL,
	[Miles] [int] NULL,
	[Year] [smallint] NULL,
	[Price] [money] NULL,
	[Color] [nvarchar](50) NULL,
	[Condition] [nvarchar](50) NULL,
	[Drive] [nvarchar](50) NULL,
	[Fuel] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[TitleStatus] [nvarchar](50) NULL,
	[Transmission] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[VIN] [nvarchar](50) NULL,
	[FeedId] [smallint] NULL,
	[Processed] [bit] NOT NULL,
	[EmailSent] [bit] NOT NULL,
	[HtmlDownloaded] [bit] NULL,
 CONSTRAINT [PK__Cars__3214EC0751B09CAA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [DateIn_Title] ON [dbo].[Car] 
(
	[DateIn] ASC,
	[Title] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IDX_Miles_Year_Price] ON [dbo].[Car] 
(
	[Miles] ASC,
	[Year] ASC,
	[Price] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [NonClusteredIndex-20150202-203043] ON [dbo].[Car] 
(
	[DateIn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_Feed] FOREIGN KEY([FeedId])
REFERENCES [dbo].[Feed] ([Id])
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_Feed]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF__Car__Processed__50C5FA01]  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF__Car__EmailSent__51BA1E3A]  DEFAULT ((0)) FOR [EmailSent]
GO
ALTER TABLE [dbo].[Car] ADD  CONSTRAINT [DF_Car_HtmlDownloaded]  DEFAULT ((0)) FOR [HtmlDownloaded]
GO
