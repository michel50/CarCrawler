IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Email_GetAllUnSent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Email_GetAllUnSent]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_Email_GetAllUnSent]
AS
BEGIN
    Set NoCount On;
	SELECT Id, EmailGeneratedDate, EmailSubject, EmailMessage, EmailSent
	FROM [CarCrawler].[dbo].[Email] where EmailSent = 0;
END

GO
