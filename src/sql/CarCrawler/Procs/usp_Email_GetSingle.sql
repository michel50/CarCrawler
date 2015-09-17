IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Email_GetSingle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Email_GetSingle]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Email_GetSingle 
	@Id int 
AS
BEGIN
    Set NoCount On;
	SELECT Id, EmailGeneratedDate, EmailSubject, EmailMessage, EmailSent
	FROM [CarCrawler].[dbo].[Email]
	WHERE
		Id = @Id 
END

GO
