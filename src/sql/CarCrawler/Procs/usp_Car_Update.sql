IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Car_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Car_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_Car_Update] 
	@Id int, 
	@DateIn datetime2, 
	@Link nvarchar(255), 
	@Title nvarchar(255), 
	@Description nvarchar(1000), 
	@Make nvarchar(255)=null, 
	@Model nvarchar(255)=null, 
	@Miles int=null, 
	@Year smallint=null, 
	@Price money=null, 
	@Color nvarchar(50)=null,
	@Condition nvarchar(50)=null,
	@Drive nvarchar(50)=null,
	@Fuel nvarchar(50)=null,
	@Size nvarchar(50)=null,
	@TitleStatus nvarchar(50)=null,
	@Transmission nvarchar(50)=null,
	@Type nvarchar(50)=null,
	@VIN nvarchar(50)=null,
	@FeedId smallint=null, 
	@Processed bit=0, 
	@EmailSent bit=0,
	@HtmlDownloaded bit = 0


AS
BEGIN
    Set NoCount On;
Begin Try

                


	UPDATE [dbo].Car SET DateIn=@DateIn,Link=@Link,Title=@Title,[Description]=@Description,Make=@Make,Model=@Model,Miles=@Miles,[Year]=@Year,Price=@Price,Color=@Color,[Condition]=@Condition,Drive=@Drive,Fuel=@Fuel,[Size]=@Size,TitleStatus=@TitleStatus,Transmission=@Transmission,[Type]=@Type,VIN=@VIN,FeedId=@FeedId,Processed=@Processed,EmailSent=@EmailSent,HtmlDownloaded=@HtmlDownloaded 
	WHERE Id=@Id

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
