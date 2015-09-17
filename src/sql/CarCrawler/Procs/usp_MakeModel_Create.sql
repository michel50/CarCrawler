IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MakeModel_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MakeModel_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_MakeModel_Create 
	@Year int, 
	@Make nvarchar(25), 
	@Model nvarchar(100), 
	@Style nvarchar(200),
	@InsertedId int output

As
Begin   
    Set NoCount On;
Begin Try
    Set @Make = @Make;
    Set @Model = @Model;
    Set @Style = @Style;

    Insert Into [CarCrawler].[dbo].[MakeModel]
		(Year, Make, Model, Style)
	Values
		(@Year, @Make, @Model, @Style) 
    
    Set @InsertedId = SCOPE_IDENTITY();
    
 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
