IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PredicateGetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PredicateGetAll]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_PredicateGetAll]
as
SELECT [Id]
      ,[PredicateSymbol]
      ,[PredicateFormat]
	  ,[PredicateForAll]
  FROM [CarCrawler].[dbo].[Predicate]
GO
