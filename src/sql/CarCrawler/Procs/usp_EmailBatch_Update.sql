IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_EmailBatch_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_EmailBatch_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_EmailBatch_Update 
	@CarId int, 
	@EmailId int 
AS
BEGIN
    Set NoCount On;
Begin Try

                
	Update [CarCrawler].[dbo].[EmailBatch]
	Set
		CarId = @CarId, 
		EmailId = @EmailId 
	Where
		CarId = @CarId and 
EmailId = @EmailId

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
