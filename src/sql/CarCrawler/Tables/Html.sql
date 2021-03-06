SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Html](
	[CarId] [int] NOT NULL,
	[Html] [nvarchar](max) NOT NULL,
	[Processed] [bit] NOT NULL,
	[DownLoadDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Html] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Html] ADD  CONSTRAINT [DF_Html_Processed]  DEFAULT ((0)) FOR [Processed]
GO
ALTER TABLE [dbo].[Html] ADD  CONSTRAINT [DF_Html_DownLoadDate]  DEFAULT (getdate()) FOR [DownLoadDate]
GO
