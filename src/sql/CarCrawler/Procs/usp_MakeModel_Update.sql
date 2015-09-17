IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MakeModel_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MakeModel_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_MakeModel_Update 
	@Id int, 
	@Year int, 
	@Make nvarchar(25), 
	@Model nvarchar(100), 
	@Style nvarchar(200) 
AS
BEGIN
    Set NoCount On;
Begin Try
    Set @Make = @Make;
    Set @Model = @Model;
    Set @Style = @Style;
                
	Update [CarCrawler].[dbo].[MakeModel]
	Set
		Year = @Year, 
		Make = @Make, 
		Model = @Model, 
		Style = @Style 
	Where
		Id = @Id

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
