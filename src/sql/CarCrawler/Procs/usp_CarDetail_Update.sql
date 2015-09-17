IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CarDetail_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CarDetail_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_CarDetail_Update] 
	@Id int, 
	@Make nvarchar(255), 
	@Model nvarchar(255), 
	@Miles int, 
	@Year smallint, 
	@Price money
AS
BEGIN
    Set NoCount On;
Begin Try

                
	Update [CarCrawler].[dbo].[Car]
	Set
		Make = @Make, 
		Model = @Model, 
		Miles = @Miles, 
		[Year] = @Year, 
		Price = @Price,
		Processed = 1
	Where
		Id = @Id

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END


GO
