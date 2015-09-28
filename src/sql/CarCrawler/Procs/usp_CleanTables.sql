IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CleanTables]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CleanTables]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_CleanTables]
as
set Nocount on
select * into #tmp from EmailBatch where CarId in
(select id from car where datediff(day,datein,getdate()) > 30)
delete from email where id in (select emailid from #tmp)
delete from EmailBatch where Carid in (select CarId from #tmp)
delete from Html where Carid in (select CarId from #tmp)
delete from car where id in (select carid from #tmp)
delete from car where datediff(day, datein, getdate()) > 30
drop table #tmp



GO
