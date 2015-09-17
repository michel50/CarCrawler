IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Query_ForEmail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Query_ForEmail]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_Query_ForEmail]
as
SELECT [Id]
	  ,[Subject]
      ,[TitleAndDescripton]
	  ,[AndOr]
	  ,[Ignore]
      ,[MakePredicate]
      ,[MakeValue]
      ,[MakeAllowNull]
      ,[ModelPredicate]
      ,[ModelValue]
      ,[ModelAllowNull]
      ,[MilesPredicate]
      ,[MilesValue]
      ,[MilesAllowNull]
      ,[YearPredicate]
      ,[YearValue]
      ,[YearAllowNull]
      ,[PricePredicate]
      ,[PriceValue]
      ,[PriceAllowNull]
      ,[Email]
  FROM [dbo].[Query] where Email = 1

GO
