IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Feed_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Feed_Delete]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Feed_Delete 
	@Id smallint 
AS
BEGIN
    Set NoCount On;
    Begin Try
	    DELETE FROM [CarCrawler].[dbo].[Feed]
	    WHERE Id = @Id 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
