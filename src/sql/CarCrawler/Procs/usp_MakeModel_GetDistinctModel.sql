IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MakeModel_GetDistinctModel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MakeModel_GetDistinctModel]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_MakeModel_GetDistinctModel
@Year int,
@Make nvarchar(25)
as
set nocount on
select distinct Model from [CarCrawler].[dbo].[MakeModel] where [year] = @year and [Make] = @Make

GO
