
-- Disable all the constraint in database
EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"
go
truncate table EmailBatch
go
delete from Email
go
delete from Html
go
delete from Car
go
EXEC sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"
go
DBCC CHECKIDENT('Car', RESEED)
DBCC CHECKIDENT('Email', RESEED)
DBCC CHECKIDENT('Feed', RESEED)
DBCC CHECKIDENT('MakeModel', RESEED)
DBCC CHECKIDENT('Query', RESEED)
DBCC CHECKIDENT('RegEx', RESEED)
go


/*
SELECT 
    IDENT_SEED(TABLE_NAME) AS Seed,
    IDENT_INCR(TABLE_NAME) AS Increment,
    IDENT_CURRENT(TABLE_NAME) AS Current_Identity,
    TABLE_NAME,
    'DBCC CHECKIDENT(' + TABLE_NAME + ', RESEED)' --, ' + CAST(IDENT_SEED(TABLE_NAME) AS VARCHAR(10)) + ')'
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    OBJECTPROPERTY(OBJECT_ID(TABLE_NAME), 'TableHasIdentity') = 1
    AND TABLE_TYPE = 'BASE TABLE'
*/
