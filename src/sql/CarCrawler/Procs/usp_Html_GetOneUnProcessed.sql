IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Html_GetOneUnProcessed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Html_GetOneUnProcessed]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_Html_GetOneUnProcessed
@CarId int
as
set nocount on
select CarId, Html, Processed from Html where CarId = @CarId and  Processed <> 1

GO
