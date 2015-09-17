IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Car_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Car_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Car_Update 
	@Id int, 
	@DateIn datetime2, 
	@Link nvarchar(255), 
	@Title nvarchar(255), 
	@Description nvarchar(1000), 
	@Make nvarchar(255), 
	@Model nvarchar(255), 
	@Miles int, 
	@Year smallint, 
	@Price money, 
	@FeedId smallint, 
	@Processed bit, 
	@EmailSent bit 
AS
BEGIN
    Set NoCount On;
Begin Try
    Set @Link = @Link;
    Set @Title = @Title;
    Set @Description = @Description;
    Set @Make = @Make;
    Set @Model = @Model;
                
	Update [CarCrawler].[dbo].[Car]
	Set
		DateIn = @DateIn, 
		Link = @Link, 
		Title = @Title, 
		Description = @Description, 
		Make = @Make, 
		Model = @Model, 
		Miles = @Miles, 
		Year = @Year, 
		Price = @Price, 
		FeedId = @FeedId, 
		Processed = @Processed, 
		EmailSent = @EmailSent 
	Where
		Id = @Id

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
