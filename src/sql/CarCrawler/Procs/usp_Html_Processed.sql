IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Html_Processed]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Html_Processed]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc usp_Html_Processed
@CarId int

as

set nocount on

update Html set Processed = 1 where CarId = @CarId
GO
