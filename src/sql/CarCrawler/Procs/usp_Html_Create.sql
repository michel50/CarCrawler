IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Html_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Html_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_Html_Create
@CarId int,
@Html nvarchar(max),
@Processed bit
as

set nocount on

insert Html(CarId, Html, Processed) values(@CarId, @Html, 0)
GO
