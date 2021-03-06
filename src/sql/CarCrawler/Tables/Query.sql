SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Query](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NULL,
	[TitleAndDescripton] [nvarchar](max) NULL,
	[AndOr] [tinyint] NULL,
	[Ignore] [nvarchar](max) NULL,
	[MakePredicate] [tinyint] NULL,
	[MakeValue] [nvarchar](50) NULL,
	[MakeAllowNull] [bit] NULL,
	[ModelPredicate] [tinyint] NULL,
	[ModelValue] [nvarchar](50) NULL,
	[ModelAllowNull] [bit] NULL,
	[MilesPredicate] [tinyint] NULL,
	[MilesValue] [nvarchar](50) NULL,
	[MilesAllowNull] [bit] NULL,
	[YearPredicate] [tinyint] NULL,
	[YearValue] [nvarchar](50) NULL,
	[YearAllowNull] [bit] NULL,
	[PricePredicate] [tinyint] NULL,
	[PriceValue] [nvarchar](50) NULL,
	[PriceAllowNull] [bit] NULL,
	[Email] [bit] NULL,
 CONSTRAINT [PK_Query] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Query]  WITH CHECK ADD  CONSTRAINT [FK_Query_Predicate] FOREIGN KEY([ModelPredicate])
REFERENCES [dbo].[Predicate] ([Id])
GO
ALTER TABLE [dbo].[Query] CHECK CONSTRAINT [FK_Query_Predicate]
GO
ALTER TABLE [dbo].[Query]  WITH CHECK ADD  CONSTRAINT [FK_Query_Predicate1] FOREIGN KEY([MilesPredicate])
REFERENCES [dbo].[Predicate] ([Id])
GO
ALTER TABLE [dbo].[Query] CHECK CONSTRAINT [FK_Query_Predicate1]
GO
ALTER TABLE [dbo].[Query]  WITH CHECK ADD  CONSTRAINT [FK_Query_Predicate2] FOREIGN KEY([YearPredicate])
REFERENCES [dbo].[Predicate] ([Id])
GO
ALTER TABLE [dbo].[Query] CHECK CONSTRAINT [FK_Query_Predicate2]
GO
ALTER TABLE [dbo].[Query]  WITH CHECK ADD  CONSTRAINT [FK_Query_Predicate3] FOREIGN KEY([YearPredicate])
REFERENCES [dbo].[Predicate] ([Id])
GO
ALTER TABLE [dbo].[Query] CHECK CONSTRAINT [FK_Query_Predicate3]
GO
ALTER TABLE [dbo].[Query]  WITH CHECK ADD  CONSTRAINT [FK_Query_Predicate4] FOREIGN KEY([PricePredicate])
REFERENCES [dbo].[Predicate] ([Id])
GO
ALTER TABLE [dbo].[Query] CHECK CONSTRAINT [FK_Query_Predicate4]
GO
ALTER TABLE [dbo].[Query]  WITH CHECK ADD  CONSTRAINT [CK_Query_AndOr] CHECK  (([AndOr]=(1) OR [AndOr]=(2)))
GO
ALTER TABLE [dbo].[Query] CHECK CONSTRAINT [CK_Query_AndOr]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_TitleAndDescripton]  DEFAULT ('') FOR [TitleAndDescripton]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_MakePredicate]  DEFAULT ((0)) FOR [MakePredicate]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_ModelPredicate]  DEFAULT ((0)) FOR [ModelPredicate]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_MilesPredicate]  DEFAULT ((0)) FOR [MilesPredicate]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_YearPredicate]  DEFAULT ((0)) FOR [YearPredicate]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_PricePredicate]  DEFAULT ((0)) FOR [PricePredicate]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_PriceAllowNull]  DEFAULT ((0)) FOR [PriceAllowNull]
GO
ALTER TABLE [dbo].[Query] ADD  CONSTRAINT [DF_Query_Email]  DEFAULT ((0)) FOR [Email]
GO
