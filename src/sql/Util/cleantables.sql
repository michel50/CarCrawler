
-- Disable all the constraint in database
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
go
truncate table EmailBatch
go
delete from Email
go
delete from Car
go
EXEC sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
go
exec sp_MSforeachtable @command1 = 'DBCC CHECKIDENT(''?'', RESEED, 1)'
go