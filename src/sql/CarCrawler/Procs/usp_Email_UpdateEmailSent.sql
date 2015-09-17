IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Email_UpdateEmailSent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Email_UpdateEmailSent]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_Email_UpdateEmailSent
@Id int
as
set nocount on
update Email set EmailSent = 1 where Id = @Id
GO
