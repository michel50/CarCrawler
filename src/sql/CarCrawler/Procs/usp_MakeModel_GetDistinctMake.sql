IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MakeModel_GetDistinctMake]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MakeModel_GetDistinctMake]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_MakeModel_GetDistinctMake
@Year int
as
set nocount on


SELECT Distinct Make, Model into #temp FROM [CarCrawler].[dbo].[MakeModel] where [year] = @year order by Model, Make
select distinct Make from #temp


GO
