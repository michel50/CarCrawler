IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CarDetail_GetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CarDetail_GetAll]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_CarDetail_GetAll]
	
AS
BEGIN
    Set NoCount On;
	SELECT Id, Title, [Description], Make, Model, Miles, [Year], Price
	FROM [CarCrawler].[dbo].[Car] where Processed = 0
	order by Id
END


GO
