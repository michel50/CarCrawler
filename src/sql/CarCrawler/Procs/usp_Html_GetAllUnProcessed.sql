IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Html_GetAllUnProcessed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Html_GetAllUnProcessed]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_Html_GetAllUnProcessed
as
set nocount on
select CarId, Html, Processed from Html where Processed <> 1

GO
