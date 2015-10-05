IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetRandomUserAgent]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetRandomUserAgent]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_GetRandomUserAgent
as
set nocount on
select top 1 UAId, UserAgents from UserAgent order by NEWID()


GO
