IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CheckForDup]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CheckForDup]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_CheckForDup]
@id int
as 
set nocount on
declare @Title nvarchar(255)
declare @Make nvarchar(255)
declare @Model nvarchar(255) 
declare @Miles int
declare @Price money

declare @ReturnCode int
set @ReturnCode = 0
select @Title = Title, @Make = Make, @Model = Model, @Miles = Miles, @Price = Price from car where id = @id

if exists(select 1 from car where Title = @Title and EmailSent = 1)
begin
	update car set EmailSent = 1 where id = @id
	set @ReturnCode =  1
end

if @Miles is not null and @Price is not null
begin
	if exists(select 1 from car where Make = @Make and Model = @Model and Miles = @Miles and Price = @Price and EmailSent = 1)
	begin
		update car set EmailSent = 1 where id = @id
		set @ReturnCode = 1
	end

end
select @ReturnCode as ReturnCode
GO
