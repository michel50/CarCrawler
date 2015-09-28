IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Car_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Car_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_Car_Create] 
	@DateIn datetime2, 
	@Link nvarchar(255), 
	@Title nvarchar(255), 
	@Description nvarchar(1000), 
	@Make nvarchar(255)=null, 
	@Model nvarchar(255)=null, 
	@Miles int=null, 
	@Year smallint=null, 
	@Price money=null, 
	@FeedId smallint=null, 
	@Processed bit=0, 
	@EmailSent bit=0,
	@HtmlDownloaded bit = 0

As
Begin   
    Set NoCount On;
Begin Try
    Set @Link = @Link;
    Set @Title = @Title;
    Set @Description = @Description;
    Set @Make = @Make;
    Set @Model = @Model;

	if not exists(select 1 from [CarCrawler].[dbo].[Car] where Title = @Title and DateIn = @DateIn) 
	begin
    Insert Into [CarCrawler].[dbo].[Car]
		(DateIn, Link, Title, Description, Make, Model, Miles, Year, Price, FeedId, Processed, EmailSent, HtmlDownloaded)
	Values
		(@DateIn, @Link, @Title, @Description, @Make, @Model, @Miles, @Year, @Price, @FeedId, @Processed, @EmailSent, 0) 
    
    
	end
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END


GO
