IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Feed_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Feed_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Feed_Update 
	@Id smallint, 
	@FeedCity nvarchar(45), 
	@FeedState nvarchar(2), 
	@FeedRssLink nvarchar(150), 
	@FeedActive bit 
AS
BEGIN
    Set NoCount On;
Begin Try
    Set @FeedCity = @FeedCity;
    Set @FeedState = @FeedState;
    Set @FeedRssLink = @FeedRssLink;
                
	Update [CarCrawler].[dbo].[Feed]
	Set
		FeedCity = @FeedCity, 
		FeedState = @FeedState, 
		FeedRssLink = @FeedRssLink, 
		FeedActive = @FeedActive 
	Where
		Id = @Id

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
