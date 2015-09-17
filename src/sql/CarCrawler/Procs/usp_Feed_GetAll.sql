IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Feed_GetAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Feed_GetAll]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Feed_GetAll
	
AS
BEGIN
    Set NoCount On;
	SELECT Id, FeedCity, FeedState, FeedRssLink, FeedActive
	FROM [CarCrawler].[dbo].[Feed]
END

GO
