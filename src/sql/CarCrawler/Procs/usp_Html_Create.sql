IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Html_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Html_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Html_Create]
@CarId int,
@Html nvarchar(max),
@Processed bit
as

set nocount on

if exists(select 1 from Html where CarId = @CarId)
	update Html set Html = @Html, Processed = 0 where CarId = @CarId
else
	insert Html(CarId, Html, Processed) values(@CarId, @Html, 0)
GO
