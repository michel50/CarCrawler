IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_EmailBatch_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_EmailBatch_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_EmailBatch_Create 
	@CarId int, 
	@EmailId int
As
Begin   
    Set NoCount On;
Begin Try


    Insert Into [CarCrawler].[dbo].[EmailBatch]
		(CarId, EmailId)
	Values
		(@CarId, @EmailId) 
    
    
 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
