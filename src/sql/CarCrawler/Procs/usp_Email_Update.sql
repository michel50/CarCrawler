IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Email_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Email_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_Email_Update] 
	@Id int, 
	@EmailGeneratedDate datetime2, 
	@EmailSubject varchar(45), 
	@EmailMessage ntext, 
	@EmailSent bit 
AS
BEGIN
    Set NoCount On;
Begin Try
                
	Update [CarCrawler].[dbo].[Email]
	Set
		EmailGeneratedDate = @EmailGeneratedDate, 
		EmailSubject = @EmailSubject, 
		EmailMessage = @EmailMessage, 
		EmailSent = @EmailSent 
	Where
		Id = @Id

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
