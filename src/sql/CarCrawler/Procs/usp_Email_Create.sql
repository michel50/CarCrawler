IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Email_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Email_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Email_Create 
	@EmailGeneratedDate datetime2, 
	@EmailSubject varchar(45), 
	@EmailMessage ntext, 
	@EmailSent bit,
	@InsertedId int output

As
Begin   
    Set NoCount On;
Begin Try
    Set @EmailMessage = @EmailMessage;

    Insert Into [CarCrawler].[dbo].[Email]
		(EmailGeneratedDate, EmailSubject, EmailMessage, EmailSent)
	Values
		(@EmailGeneratedDate, @EmailSubject, @EmailMessage, @EmailSent) 
    
    Set @InsertedId = SCOPE_IDENTITY();
    
 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
